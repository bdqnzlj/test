package cn.lyx.dao.impl;

import cn.lyx.dao.UserDao;
import cn.lyx.domain.User;
import cn.lyx.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class UserDaoImpl implements UserDao {
    private JdbcTemplate jt = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<User> findAll() {
        //使用jdbc操作数据库
        String sql = "select * from user";
        List<User> users = jt.query(sql,new BeanPropertyRowMapper<User>(User.class));
        return users;
    }

    @Override
    public User login(String username, String password) {
        User user = null;
        try {
            String sql = "select * from user where username = ? and password = ?";
            user = jt.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username, password);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return user;
        }
    }

    @Override
    public void addContact(User u) {
        String sql = "insert into user(name,sex,age,address,QQ,eamil,username,password) values(?,?,?,?,?,?,?,?)";
        jt.update(sql,u.getName(), u.getSex(), u.getAge(), u.getAddress(), u.getQQ(), u.getEamil(), u.getUsername(), u.getPassword());
    }

    @Override
    public void delUser(int id) {
        String sql = "delete from user where id=?";
        jt.update(sql,id);
    }

    @Override
    public User updUser(int id) {
        String sql = "select * from user where id = ?";
        User user = jt.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), id);
        return user;
    }

    @Override
    public void updateUser(User user) {
        String sql = "update user set name=?,sex=?,age=?,address=?,QQ=?,eamil=?,username=?,password=? where id=?";
        jt.update(sql,user.getName(), user.getSex(), user.getAge(), user.getAddress(), user.getQQ(), user.getEamil(), user.getUsername(), user.getPassword(),user.getId());
    }

    @Override
    public int findTotalCount(Map<String, String[]> parameterMap) {
        //定义模板初始化sql
        String sql = "select count(*) from user where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        //遍历map
        Set<String> keySet = parameterMap.keySet();
        //定义参数的集合
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {
            //排除分页条件参数
            if("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }
            //获取value
            String value = parameterMap.get(key)[0];
            //判断value是否优质
            if (value != null && !"".equals(value)){
                //有值
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");
            }
        }
        return jt.queryForObject(sb.toString(),Integer.class,params.toArray());
    }

    @Override
    public List<User> findByPage(int start, int rows, Map<String, String[]> parameterMap) {
        String sql = "select * from user  where 1 = 1 ";

        StringBuilder sb = new StringBuilder(sql);
        //2.遍历map
        Set<String> keySet = parameterMap.keySet();
        //定义参数的集合
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {

            //排除分页条件参数
            if("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }

            //获取value
            String value = parameterMap.get(key)[0];
            //判断value是否有值
            if(value != null && !"".equals(value)){
                //有值
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");//？条件的值
            }
        }
        //添加分页查询
        sb.append(" limit ?,? ");
        //添加分页查询参数值
        params.add(start);
        params.add(rows);
        sql=sb.toString();
        return jt.query(sql,new BeanPropertyRowMapper<User>(User.class),params.toArray());
    }
}
