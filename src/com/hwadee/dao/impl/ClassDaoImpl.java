package com.hwadee.dao.impl;

import com.hwadee.dao.ClassDao;
import com.hwadee.model.Class;
import com.hwadee.model.Student;
import com.hwadee.utils.JDBCUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

/**
 * @Author LH
 * @Description class dao实现类
 * @Date Create in 9:44 2020/7/21
 */
public class ClassDaoImpl implements ClassDao {
    JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    /**
     * 分页查询
     * 从start开始，共row条记录
     * @return
     */
    @Override
    public List findByPage(int start,int rows) {
        String sql="select * from class limit ?,? ";
        List<Class> list = template.query(sql, new BeanPropertyRowMapper<Class>(Class.class),start,rows);
        return list;
    }

    /**
     * 查询记录条数
     *
     * @return
     */
    @Override
    public int FindTotalCount() {
        try {
            String sql="select count(*) from class";
            Integer integer = template.queryForObject(sql, Integer.class);
            return integer;
        } catch (DataAccessException e) {
            return 0;
        }
    }

    /**
     * 添加班级
     *
     * @param c
     */
    @Override
    public void add(Class c) {
        String sql="insert into class values(?,?,?)";
        template.update(sql,c.getC_no(),c.getC_name(),c.getDno());
    }

    /**
     * 根据班级号查询班级
     *
     * @param c_no
     * @return
     */
    @Override
    public Class findByC_no(String c_no) {
        try {
            String sql="select * from class where c_no=?";
            Class aClass = template.queryForObject(sql, new BeanPropertyRowMapper<Class>(Class.class), c_no);
            return aClass;
        } catch (DataAccessException e) {
            return null;
        }
    }
}
