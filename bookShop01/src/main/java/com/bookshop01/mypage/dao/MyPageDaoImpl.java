package com.bookshop01.mypage.dao;

import javax.sql.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Reader;
import java.sql.*;
import javax.naming.*;

import javax.servlet.http.HttpServletRequest;

import com.bookshop01.member.vo.MemberBean;
import com.bookshop01.mypage.vo.MyPageBean;
import com.bookshop01.order.vo.OrderBean;

import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;

@Repository("myPageDao")
public class MyPageDaoImpl implements MyPageDao{
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<OrderBean> listMyOrderGoods(MemberBean memberBean) throws Exception{
		String member_id=memberBean.getMember_id();
		ArrayList<OrderBean> orderGoodsList=new ArrayList<OrderBean>();
		orderGoodsList=(ArrayList)sqlSession.selectList("mapper.mypage.listMyOrderGoods",member_id);
		return orderGoodsList;
	}
	
	public ArrayList findMyOrderInfo(String order_id) throws Exception{
		ArrayList my_order_list=(ArrayList)sqlSession.selectList("mapper.mypage.findMyOrderInfo",order_id);
		return my_order_list;
	}	

	public ArrayList<OrderBean> listMyOrderHistory(MyPageBean  myPageBean) throws Exception{
		ArrayList<OrderBean> my_order_hist_list=(ArrayList)sqlSession.selectList("mapper.mypage.listMyOrderHistory",myPageBean);
		return my_order_hist_list;
	}
	
	public void modifyMyInfo(HashMap memberMap) throws Exception{
		sqlSession.update("mapper.mypage.modifyMyInfo",memberMap);
	}
	
	public MemberBean myInfoDetail(String member_id) throws Exception{
		MemberBean memberBean=(MemberBean)sqlSession.selectOne("mapper.mypage.myInfoDetail",member_id);
		return memberBean;
		
	}
	
	public void cancelOrder(String order_id) throws Exception{
		sqlSession.update("mapper.mypage.cancelOrder",order_id);
	}
	

	//메인 설정 화면 변경 메서드
	public void modifyMainSetting(HashMap showMap) throws Exception{
		
		/*
		  showMap에 저장된 키들을 가지고 와서, for문을 돌면서 
		  각 키에 대한 값을 다시 가지고 와서 
		   가지고 온 (key,value)로 다시 HashMap에 저장한 후 쿼리로 전달한다. 
		 */
		
		String member_id=(String)showMap.get("member_id");
		showMap.remove("member_id");
		
		Set set=showMap.keySet();
		
		Object[] keys=set.toArray();
		for(int i=0; i<keys.length;i++){
			HashMap settingMap=new HashMap();
			//System.out.println("key:"+keys[i]);
			String value=(String)showMap.get(keys[i]);
			settingMap.put("goods_type",keys[i]);
			settingMap.put("show_yn",value);
			//System.out.println(key:"+keys[i]+"value:"+value);
			settingMap.put("member_id",member_id);
			sqlSession.update("mapper.mypage.modifyMainSetting",settingMap);
		}
		
		
	}
	
	//메인 설정 정보 조회 메서드
	public ArrayList  myPageSettingList(String member_id) throws Exception{
		ArrayList myPageSettingList =(ArrayList)sqlSession.selectList("mapper.mypage.myPageSettingList",member_id);
		return myPageSettingList;
	}
				
	
}
