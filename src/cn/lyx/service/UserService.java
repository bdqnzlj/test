package cn.lyx.service;

import cn.lyx.domain.PageBean;
import cn.lyx.domain.User;

import java.util.List;
import java.util.Map;

/*
    用户管理的业务接口
 */
public interface UserService {

    /**
     * 查询所有信息方法
     * @return
     */
    public List<User> findAll();
    /**
     * 登录方法
     * @return
     */
    public User login(User u);

    /**
     * 添加功能
     * @param u
     * @return
     */
    public void addContact(User u);

    /**
     * 删除功能
     * @param id
     */
    public void delUser(String id);//传参String的原因是,他获取id的请求是字符串类型的

    /**
     * 修改功能的回显信息
     * @param id
     * @return
     */
    public User updUser(String id);//传参String的原因是,他获取id的请求是字符串类型的

    /**
     * 修改功能
      * @param user
     */
    public void updateUser(User user);

    public void delSelected(String[] ids);

    public PageBean<User> findUserByPage(String _currentPage, String _rows, Map<String, String[]> parameterMap);
}
