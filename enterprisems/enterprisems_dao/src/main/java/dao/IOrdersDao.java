package dao;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.mysql.fabric.xmlrpc.base.Member;

import pojo.Orders;
import pojo.Product;

public interface IOrdersDao {
	@Select("select * from orders")
	//相當於resultmap
	@Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "dao.IProductDao.findById")),
    })
    public List<Orders> findAll() throws Exception;
    //多表操作
	@Select("select * from orders where id=#{oredersId}")
	@Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "dao.IProductDao.findById")),
            @Result(property="member",column="memberId",javaType=Member.class,one=@One(select =  "dao.IMemberDao.findById")),
            @Result(property="travellers",column="id",javaType=java.util.List.class,many=@Many(select = "dao.ITravellerDao.findByOrdersId"))
	})
	public Orders findById(String ordersId) throws Exception;
}
