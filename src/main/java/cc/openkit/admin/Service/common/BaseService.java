package cc.openkit.admin.Service.common;

import java.util.List;

public interface BaseService<T> {
    //根据id查询实体
    T queryById(int id);

    //根据id查询实体（主键为UUID）
    T queryByUUID(String id);

    //查询所有
    List<T> queryAll();

    //条件查询
    List<T> queryListByWhere(T param);

    //查询记录数
    Integer queryCount(T param);

    //分页查询
    List<T> queryPageListByWhere(T param,Integer page,Integer rows);

    //查询一条记录
    T queryOne(T param);

    //插入
    Integer save(T param);

    //新增非空字段
    Integer saveSelect(T param);

    //根据主键更新
    Integer update(T param);

    //根据主键更新非空字段
    Integer updateSelective(T param);

    //根据主键删除
    Integer deleteById(int id);

    Integer deleteByUUId(String id);

    //批量删除
    Integer deleteByIds(Class<T> clazz,List<Object> values);

    //多条件模糊分页查询
    List<T> queryPageListWhereLike(Class<T> clazz,T param,Integer page,Integer rows);

    //多条件模糊查询分页
    List<T> queryListWhereLike(Class<T> clazz,T param);

    //根据条件模糊查询总条数
    Integer queryCountWhereLike(Class<T> clazz,T param);
}
