package com.bookshop01.goods.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookshop01.goods.vo.GoodsBean;
import com.bookshop01.goods.vo.ReviewBean;
import com.bookshop01.goods.vo.UserRecoBean;

public interface GoodsDao {
	public ArrayList listGoods(String goodsType ) throws Exception;
	public GoodsBean goodsDetail(String goods_id) throws Exception;
	public ArrayList goodsDetailImage(String goods_id) throws Exception;
	public ArrayList keywordSearch(String keyword) throws Exception;
	public ArrayList searchGoods(String searchWord) throws Exception;
	public ArrayList reviewList(ReviewBean reviewBean) throws Exception;
	public void insertReview(ReviewBean reviewBean) throws Exception;
	public ArrayList mainSettingList(String member_id) throws Exception;
	
	public ArrayList searchWordList() throws Exception;
	public ArrayList popupList() throws Exception;
	
	//��ǰ �� �˻� �޼���
	public ArrayList detailSearch(HashMap condMap) throws Exception;
	
	
	//����� ��õ ���� ���� ������ ���� �޼���
	public ArrayList userRecoList(HashMap recoMap) throws Exception;
	
	public void addUserRecoGoods(UserRecoBean userRecoBean) throws Exception;
}
