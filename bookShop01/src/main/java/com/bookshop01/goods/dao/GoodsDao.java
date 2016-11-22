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
	
	//제품 상세 검색 메서드
	public ArrayList detailSearch(HashMap condMap) throws Exception;
	
	
	//사용자 추천 도서 내용 가지고 오는 메서드
	public ArrayList userRecoList(HashMap recoMap) throws Exception;
	
	public void addUserRecoGoods(UserRecoBean userRecoBean) throws Exception;
}
