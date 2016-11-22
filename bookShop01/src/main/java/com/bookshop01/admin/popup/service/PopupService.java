package com.bookshop01.admin.popup.service;

import java.util.ArrayList;
import java.util.HashMap;
import com.bookshop01.admin.popup.vo.PopupBean;

public interface PopupService {
	public void addPopup(PopupBean popupBean) throws Exception;

	//�˾� ���� ������ ��ȸ�ϴ� �޼���
	public ArrayList listPopupGoods(HashMap condMap) throws Exception;
	
	public void deletePopup(String goods_id) throws Exception;
	
}
