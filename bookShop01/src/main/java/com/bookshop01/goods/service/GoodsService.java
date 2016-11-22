package com.bookshop01.goods.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.goods.vo.GoodsBean;
import com.bookshop01.goods.vo.ReviewBean;
import com.bookshop01.goods.vo.UserRecoBean;
import com.bookshop01.member.vo.MemberBean;

public interface GoodsService {
	
	public HashMap<String,ArrayList<GoodsBean>> listGoods() throws Exception;
	public HashMap<String,ArrayList<GoodsBean>> listGoods(MemberBean memberBean) throws Exception;
		
	public HashMap goodsDetail(String _goods_id,int chapter,int pageNum) throws Exception;
	public ArrayList keywordSearch(String keyword) throws Exception;
	public ArrayList searchGoods(String searchWord) throws Exception;
	public void addReview(ReviewBean reviewBean) throws Exception;
	
	//상세 검색 메서드
	public ArrayList detailSearch(HashMap condMap) throws Exception;
	
	//사용자  추천 도서 추가 메서드 
	public void addUserRecoGoods(UserRecoBean userRecoBean) throws Exception;
	
	
}
