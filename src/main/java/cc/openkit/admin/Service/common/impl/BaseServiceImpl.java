package cc.openkit.admin.Service.common.impl;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

/*
* service层对基本增删改查分页等的封装
* 继承此类后就不需要写增删改查了
*
* */
public abstract class BaseServiceImpl<T> {

    @Autowired
    private Mapper<T> mapper;

    //根据id查询主体
    //根据id查询实体
    public T queryById(int id){
        return this.mapper.selectByPrimaryKey(id);
    }

    //根据id查询实体（主键为UUID）
    public T queryByUUID(String id){
        return this.mapper.selectByPrimaryKey(id);
    }

    //查询所有
    public List<T> queryAll(){
        return this.mapper.selectAll();
    }

    //条件查询
    public List<T> queryListByWhere(T param){
        return this.mapper.select(param);
    }

    //查询记录数
    public Integer queryCount(T param){
        return this.mapper.selectCount(param);
    }

    //分页查询
    public List<T> queryPageListByWhere(T param,Integer page,Integer rows){
        PageHelper.startPage(page,rows);
        List<T> list=this.queryListByWhere(param);
        return list;
    }

    //查询一条记录
    public T queryOne(T param){
        return this.mapper.selectOne(param);
    }

    //插入
    public Integer save(T param){
        return this.mapper.insert(param);
    }

    //新增非空字段
    public Integer saveSelect(T param){
        return this.mapper.insertSelective(param);
    }

    //根据主键更新
    public Integer update(T param){
        return this.mapper.updateByPrimaryKey(param);
    }

    //根据主键更新非空字段
    public Integer updateSelective(T param){
        return this.mapper.updateByPrimaryKeySelective(param);
    }

    //根据主键删除 关键是自增
    public Integer deleteById(int id){
        return this.mapper.deleteByPrimaryKey(id);
    }

    //根据主键删除 主键：UUID
    public Integer deleteByUUId(String id){
        return this.mapper.deleteByPrimaryKey(id);
    }

    //批量删除
    public Integer deleteByIds(Class<T> clazz,List<Object> values){
        Example example=new Example(clazz);
        example.createCriteria().andIn("id",values);
        return this.mapper.deleteByExample(example);
    }

    //多条件模糊分页查询
    public List<T> queryPageListWhereLike(Class<T> clazz,T param,Integer page,Integer rows){
       PageHelper.startPage(page,rows);
       return this.queryListWhereLike(clazz,param);
    }

    //多条件模糊查询 （没有分页）
    public List<T> queryListWhereLike(Class<T> clazz,T param){
        Example example=getExample(clazz,param);
        return this.mapper.selectByExample(example);
    }

    //根据条件模糊查询总条数
    public Integer queryCountWhereLike(Class<T> clazz,T param){
        Example example=getExample(clazz, param);
        return this.mapper.selectCountByExample(example);
    }

    /*
    *根据属性名获取属性值（工具类）
    *
    **/
    private Object getFieldValueByName(String fieldName,Object o){
        try {
            String firstLetter=fieldName.substring(0,1).toUpperCase();
            String getter="get"+firstLetter+fieldName.substring(1);
            Method method=o.getClass().getMethod(getter,new Class[]{});
            Object value=method.invoke(o,new Object[]{});
            return value;
        } catch (Exception e){
            e.getMessage();
            return null;
        }
    }

    /*
    * 解析并添加到example中
    *
    * */
    private Example getExample(Class<T> clazz,T param){
        Example example=new Example(clazz);      //注意用的是类的属性，不是数据库中的属性
        Example.Criteria criteria=example.createCriteria();
        //开始解析对象属性
        Field[] fields=param.getClass().getDeclaredFields();
        String[] fieldNames=new String[fields.length];

        int n=0;

        for (int i=0;i<fields.length;i++){
            String name=fields[i].getName();
            Object value=getFieldValueByName(fields[i].getName(),param);

            if (value!=null && !"".equals(value)){
                criteria.andLike(name,"%"+value+"%");
            }
        }
        example.and(criteria);
        return example;

    }


}
