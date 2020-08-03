package com.daniel.controller;

import com.daniel.pojo.Shop;
import com.daniel.service.ShopService;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.*;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.RAMDirectory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 中文检索还存在问题
 */

@Controller
public class SearchController {

    @Autowired
    private ShopService shopService;

    @RequestMapping("searchShop.do")
    public ModelAndView searchShop(Shop shop) throws IOException, ParseException {

        ModelAndView mav = new ModelAndView("searchShop");

        // 关键字
        String keyword = shop.getName();
        System.out.println(keyword);
        // 准备中文分词器
        IKAnalyzer analyzer = new IKAnalyzer();
        // 索引
        Directory index = createIndex(analyzer);
        // 查询器
        Query query = new QueryParser("name",analyzer).parse(keyword);
        // 搜索
        IndexReader reader = DirectoryReader.open(index);
        IndexSearcher searcher = new IndexSearcher(reader);
        int numberPerPage = 10;
        ScoreDoc[] hits = searcher.search(query,numberPerPage).scoreDocs;
        List<Shop> shops = new ArrayList<>();
        for (int i = 0; i < hits.length; i++) {
            ScoreDoc scoreDoc = hits[i];
            int docId = scoreDoc.doc;
            Document document = searcher.doc(docId);
            Shop tmpShop = shopService.get(Integer.parseInt(document.get("id")));
            shops.add(tmpShop);
        }

        mav.addObject("shops",shops);
        return mav;
    }

    private Directory createIndex(IKAnalyzer analyzer) throws IOException {
        Directory index = new RAMDirectory();
        IndexWriterConfig config = new IndexWriterConfig(analyzer);
        IndexWriter writer = new IndexWriter(index,config);
        List<Shop> shops = shopService.list();
        for (Shop shop : shops) {
            addDoc(writer,shop);
        }
        writer.close();
        return index;
    }

    private void addDoc(IndexWriter writer,Shop shop) throws IOException {
        Document doc = new Document();
        doc.add(new TextField("id",shop.getId()+"",Field.Store.YES));
        doc.add(new TextField("name",shop.getName(),Field.Store.YES));
        writer.addDocument(doc);
    }

}
