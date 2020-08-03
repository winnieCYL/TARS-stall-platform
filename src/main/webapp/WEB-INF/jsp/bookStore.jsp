<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>地摊详情页</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/book.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <style type="text/css">
        html,body{
            width:100%;
            height:100%;
        }
        *{
            margin:0px;
            padding:0px;
        }
        body {
            font: 12px/16px Verdana, Helvetica, Arial, sans-serif;
        }
        #map{
            left:10%;
            width:300px;
            height:40%;
            word-wrap: break-word;
            min-width:30%;
            min-height:300px;
            display: inline-block;
        }
        #description{
            left: 50%;
            display: inline-block;
            position: absolute;
            width: 300px;
            height: 40%;
            border-style:groove;
            /*border-bottom: 3px solid green;*/
        }

    </style>
    <script charset="utf-8" src="https://map.qq.com/api/js?v=2.exp&key=ZIABZ-2RI3D-EF54E-HHWCC-TAWQF-KVBRJ"></script>

</head>
<body>
<!-- 导航 -->
<header>
    <nav class="navbar">
        <div class="nav-info">
            <a href="#" class="username">${user.getName()}</a>
            <a href="/myBookshelf.do" class="bookshelf">||&nbsp;&nbsp;&nbsp;我的地摊</a>
            <a href="#" class="logout">[ 退 出 ]</a>
        </div> <!-- nav-info -->
        <form action="searchBook.do" method="post">
            <div class="nav-search">
                <a href="home.do"><img class="logo" src="<%=request.getContextPath()%>/img/logo2.png"></a>
                <div class="search-form">
                    <input id="search-input" name="name" type="search" class="searchIn" placeholder="搜图书...">
                    <a href="#" class="search-logo">| &nbsp;<img src="<%=request.getContextPath()%>/img/search.png"></a>
                    <button type="submit" id="search-button" class="searchBtn">搜索</button>
                </div>
            </div><!--  nav-search -->
        </form>
        <ul class="menu">
            <li><a href="/home.do">首页</a></li>
            <li><a class="active" href="/goBookStore.do">地摊详情</a></li>
            <li><a href="/goAskBookStore.do">求购区</a></li>
        </ul>
    </nav>
    <%--    <div class="bookstore-pic"></div>--%>

</header>
<!-- 地摊商品页面 -->
<div id="map"></div>
<div id="description">
    <%--这部分是地摊信息的展示--%>
    <span class="book-name">${book.getName()}</span>
    <span class="book-publish">${book.getAuthor()} 著 / ${book.getPress()} / ${book.getPublishDate()} / ${book.getVersion()}</span>
    <span class="book-price">
				<p>售价 <a class="final-price">￥${book.getPrice()}</a></p>
<%--				<p>定价 <a class="original-price">￥${book.getOriginalPrice()} </a></p>--%>
<%--				<p>品相 <a class="condition">${book.getDegree()}新</a></p>--%>
			</span>
    <span class="book-descr">
				<p>这一大块是地摊信息展示<a class="book-desc">${book.getDescription()}</a></p>
				<p>更新时间<a class="upload-time">2018-03-20</a></p>
			</span>
</div>

<div id="container">

    <div id="book-menu">
        <ul class="book-class">
            <c:forEach items="${categories}" var="category">
                <li><a href="goBookStore.do?id=${category.key}">${category.value}</a></li>
            </c:forEach>
        </ul>
    </div>
<%--    <div id="book-menu-toggle">--%>
<%--        查 看 菜 单--%>
<%--        <div id="toggle-btn"></div>--%>
<%--    </div>--%>
    <script type="text/javascript">
        var map = new qq.maps.Map(document.getElementById("map"), {
            // 地图的中心地理坐标。
            center: new qq.maps.LatLng(31.2836614,121.5000599),
            zoom: 15
        });
    </script>
    <div id="book-container">
        <h3 class="book-title"><a href="#">| ${categoryName}</a></h3>
        <ul class="book-lists">
            <c:forEach items="${books}" var="book" varStatus="bookStatus">
                <li class="book-list">
                    <a href="bookDetail.do?id=${book.getId()}" class="book-pic" target="_blank">
                        <img src="<%=request.getContextPath()%>/img/book-list/article/${book.getBookImage().getId()}.jpg">
                    </a>
                    <a href="#" class="book-info">
                        <h5 class="book-name">${book.getName()}</h5>
                        <span class="book-detail">${book.getDescription()}</span>
                    </a>
                    <span class="book-price">￥${book.getPrice()}
						<a href="#" class="book-buy">立即下单</a>
                </span>
                </li>
            </c:forEach>

        </ul><!--  book-list end -->
    </div> <!-- book-container end-->
    <span class="page-btn">
			<a href="?start=0" class="page-top">首页</a>
			<a href="?start=${page.getStart()-page.getCount()}" class="page-pre">上一页</a>
			<a href="?start=${page.getStart()+page.getCount()}" class="page-next">下一页</a>
			<a href="?start=${page.getEnd()}" class="page-end">尾页</a>
    </span>
</div><!-- container end-->
<footer>
    <a href="#">©2020 二手书交易</a>
    <a href="#">意见反馈&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;隐私权声明&nbsp;&nbsp;&nbsp;使用条款</a>
</footer>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/session.js"></script>
<script type="text/javascript">
    $(function(){
        //菜单特效
        var index = 0;
        $("#book-menu-toggle").on("click",function(){
            if (index ===0 ) {
                $("#book-menu").css("left","1px");
                $(this).css("left","178px");
                index =1;
            }else{
                $("#book-menu").css("left","-180px");
                $(this).css("left","1px");
                index=0;
            }
        });

        //点击菜单，对应类别颜色加深
        $(".book-class li").on("click",function(){
            //加粗当前点击的li
            $(this).css("font-weight","600").siblings("li").css("font-weight","500");
        });
    })
</script>
</body>
</html>