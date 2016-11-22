package com.bookshop01.admin.popup.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookshop01.admin.popup.vo.PopupBean;

public interface PopupDao {
	public void addPopup(PopupBean popupBean) throws Exception;
	
	public ArrayList listPopupGoods(HashMap condMap) throws Exception;
	
	public void deletePopup(String goods_id) throws Exception;
}

