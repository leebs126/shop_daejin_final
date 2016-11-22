package com.bookshop01.admin.popup.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop01.admin.popup.vo.PopupBean;

@Repository("popupDao")
public class PopupDaoImpl implements PopupDao {
	@Autowired
	private SqlSession sqlSession;
	
	public void addPopup(PopupBean popupBean) throws Exception{
		sqlSession.insert("mapper.admin.popup.addPopup",popupBean);
	}
	
	public ArrayList listPopupGoods(HashMap condMap) throws Exception{
		ArrayList popupList=(ArrayList)sqlSession.selectList("mapper.admin.popup.listPopupGoods",condMap);
		return popupList;
	}
	
	public void deletePopup(String goods_id) throws Exception{
		sqlSession.delete("mapper.admin.popup.deletePopup",goods_id);
	}
}


