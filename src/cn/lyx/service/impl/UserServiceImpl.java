package cn.lyx.service.impl;

import cn.lyx.dao.UserDao;
import cn.lyx.dao.impl.UserDaoImpl;
import cn.lyx.domain.PageBean;
import cn.lyx.domain.User;
import cn.lyx.service.UserService;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {
    private UserDao udi = new UserDaoImpl();
    @Override
    public List<User> findAll() {
        //调用dao完成查询
        return udi.findAll();
    }

    @Override
    public User login(User u) {
        return udi.login(u.getUsername(),u.getPassword());
    }

    @Override
    public void addContact(User u) {
        udi.addContact(u);
    }

    @Override
    public void delUser(String id) {
        udi.delUser(Integer.parseInt(id));
    }

    @Override
    public User updUser(String id) {
        return udi.updUser(Integer.parseInt(id));
    }

    @Override
    public void updateUser(User user) {
        udi.updateUser(user);
    }

    @Override
    public void delSelected(String[] ids) {
        if(ids!=null && ids.length > 0) {
            for (String uid : ids) {
                udi.delUser(Integer.parseInt(uid));
            }
        }
    }

    @Override
    public PageBean<User> findUserByPage(String _currentPage, String _rows, Map<String, String[]> parameterMap) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        if(currentPage <= 0){
            currentPage=1;
        }

        //1.创建空的PageBean对象
        PageBean<User> pb = new PageBean<>();
        //2.设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        //3.调用dao查询总记录数
        int totalCount = udi.findTotalCount(parameterMap);

        pb.setTotaCount(totalCount);
        //4.调用dao查询List集合
        //计算开始的记录索引
        int start = (currentPage-1)*rows;
        List<User> list = udi.findByPage(start,rows,parameterMap);
        pb.setList(list);
        //5.计算总页码
        int totalPage = (totalCount % rows) == 0 ? (totalCount/rows) : (totalCount/rows)+1;
        pb.setTotalPage(totalPage);
        if (currentPage >= totalPage){
            currentPage = 3;
        }
        return pb;
    }
}
