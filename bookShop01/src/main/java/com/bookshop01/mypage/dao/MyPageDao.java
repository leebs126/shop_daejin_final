package com.bookshop01.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookshop01.member.vo.MemberBean;
import com.bookshop01.mypage.vo.MyPageBean;
import com.bookshop01.order.vo.OrderBean;

public interface MyPageDao {
	public ArrayList<OrderBean> listMyOrderGoods(MemberBean memberBean) throws Exception;
	public ArrayList findMyOrderInfo(String order_id) throws Exception;
	public ArrayList<OrderBean> listMyOrderHistory(MyPageBean  myPageBean) throws Exception;
	public void modifyMyInfo(HashMap memberMap) throws Exception;
	public MemberBean myInfoDetail(String member_id) throws Exception;
	public void cancelOrder(String order_id) throws Exception;
	
	//메인 설정 화면 변경 메서드
	public void modifyMainSetting(HashMap showMap) throws Exception;
	
	//메인 설정 정보 조회 메서드
	public ArrayList  myPageSettingList(String member_id) throws Exception;
		
	
}
