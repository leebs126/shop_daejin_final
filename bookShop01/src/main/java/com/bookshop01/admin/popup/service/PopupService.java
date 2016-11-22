package com.bookshop01.admin.popup.service;

import java.util.ArrayList;
import java.util.HashMap;
import com.bookshop01.admin.popup.vo.PopupBean;

public interface PopupService {
	public void addPopup(PopupBean popupBean) throws Exception;

	//팝업 관련 정보를 조회하는 메서드
	public ArrayList listPopupGoods(HashMap condMap) throws Exception;
	
	public void deletePopup(String goods_id) throws Exception;
	
}
