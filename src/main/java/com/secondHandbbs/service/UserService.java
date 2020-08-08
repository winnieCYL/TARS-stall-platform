package com.secondHandbbs.service;


import com.secondHandbbs.dao.RoleRepository;
import com.secondHandbbs.dao.UserRepository;
import com.secondHandbbs.domain.Product;
import com.secondHandbbs.domain.Role;
import com.secondHandbbs.domain.User;
import com.secondHandbbs.util.FileUtils;
import com.secondHandbbs.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;

    @Value("${web.upload-path}")
    private String path;


    /**
     *  用户在登录的时候传入的用户名，根据用户名去查询用户信息（查出来之后，系统会自动进行密码比对）
     *@Author: qiuwenhao
     *@date: 2020/7/30
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("用户不存在");
        }
        return user;
    }


    /**
     *  注册用户
     *@Author: qiuwenhao
     *@date: 2020/7/31
     */
    public boolean registerUser(User user) {
//        判断用户名是否已经被存在
        if (userRepository.findByUsername(user.getUsername()).isEmpty()) {
            user=setUserInfo(user);
            userRepository.save(user);
            return true;
        }
        return false;
    }

    /**
     *  更新用户商店信息
     */
    public User saveUser(User user) {
        return userRepository.save(user);
    }

    /**
     *  设置部分用户信息
     *@Author: qiuwenhao
     *@date: 2020/7/31
     */
    private User setUserInfo(User user){
        //            添加用户的默认角色
        Set<Role> roles=new HashSet<Role>();
        roles.add(roleRepository.getOne((long) 2));
        user.setRoles(roles);
//            设置(加密密码)
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
//        设置创建时间
        Date date=new Date();
        user.setCreateTime(date);
        return user;
    }


    /**
     *  用户登录
     *@Author: qiuwenhao
     *@date: 2020/7/28
     */
    public Boolean login(User user,HttpSession session) {
        user = userRepository.findByUsernameAndPassword(user.getUsername(), user.getPassword());
        if (user!=null){
//                不暴露用户密码
            user.setPassword(null);
            session.setAttribute("user",user);
            return true;
        }
        return  false;
    }

    /**
     *  判断当前用户是否是管理者
     *@Author: qiuwenhao
     *@date: 2020/7/28
     */
    public Boolean isAdmin(HttpSession session){
        Long isadmin=(Long) session.getAttribute("role");
        if (isadmin!=2){
            return true;
        }
        return false;

    }


//    统计总人数
    public long userCount(){
        return userRepository.count();
    }

    /**
     *  保存商店信息
     */
    public boolean saveShop(User user, MultipartFile[] files, HttpSession session)
            throws IllegalStateException, IOException {
        List<String> imgs=saveImgs(user,files);
        user.setImgs(imgs);
        userRepository.save(user);

        return true;
    }


    /**
     *  保存商店的图片
     */
    public List<String> saveImgs(User user, MultipartFile[] files) throws IllegalStateException, IOException {
        //        保存图片文件
        List<String> imgs= new ArrayList();
        if (null != files && files.length > 0) {
//            文件夹完整的路径
//            类似于 "E://log/secondhand-bbs/productImgs/1/二手洗面奶
            String completePath=path+ File.separator
                    + "shopsImgs"+File.separator
                    + user.getId()+ File.separator
                    +user.getShopname();
//            存入数据库是的路径
//            类似于 "productImgs/1/二手洗面奶
            String dataPath="shopsImgs"+File.separator
                    +user.getId()+ File.separator
                    +user.getShopname();
            for (MultipartFile file : files) {
//                保存文件
                if (file.getSize()!=0){
//                    拼接一个文件路径出来 用户id/商品名称/图片名称
//                    使用File.separator是为了解决Linux和Windows上的路径差异
                    imgs.add(dataPath+File.separator+file.getOriginalFilename());
                    FileUtils.saveFile(file,completePath);
                }
            }
        }

        return imgs;
    }

}
