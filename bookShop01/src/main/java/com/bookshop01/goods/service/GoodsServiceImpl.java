package com.bookshop01.goods.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.bookshop01.goods.dao.GoodsDao;
import com.bookshop01.goods.dao.GoodsDaoImpl;
import com.bookshop01.goods.vo.GoodsBean;
import com.bookshop01.goods.vo.ImageFileBean;
import com.bookshop01.goods.vo.ReviewBean;
import com.bookshop01.goods.vo.UserRecoBean;
import com.bookshop01.member.vo.MemberBean;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	GoodsDao goodsDao;
	
	//로그인 메인 화면에 표시된 제품 정보와 팝업 정보 조회 기능
	public HashMap<String,ArrayList<GoodsBean>> listGoods(MemberBean memberBean) throws Exception {
		String member_id=memberBean.getMember_id();
		
		ArrayList settingList=goodsDao.mainSettingList(member_id);
		
		HashMap<String,ArrayList<GoodsBean>> goodsMap=new HashMap<String,ArrayList<GoodsBean>>();
		//먼저 t_shoping_main_setting테이블에서 7개의  제품 타입을 얻어와서
		//각 제품 타입 별로 t_goods_info에서제품을 각가 조회한 후 
		//ArrayList에 각각 저장한 후 hashMap에 다시 저장한다.
		for(int i=0;i<settingList.size();i++){
			GoodsBean goodsBean=(GoodsBean)settingList.get(i);
			String goods_type=(String)goodsBean.getGoods_type();
			ArrayList goodsList=goodsDao.listGoods(goods_type);
			goodsMap.put(goods_type,goodsList);
		}
		
		//팝업 정보 가지고 오기
		ArrayList popupList=goodsDao.popupList();
		goodsMap.put("popupList", popupList);
		
		return goodsMap;
	}
	
	//메인 화면에 표시된 제품 정보와 팝업 정보 조회 기능
	public HashMap<String,ArrayList<GoodsBean>> listGoods() throws Exception {
		HashMap<String,ArrayList<GoodsBean>> goodsMap=new HashMap<String,ArrayList<GoodsBean>>();
		ArrayList goodsList=goodsDao.listGoods("bestseller");
		goodsMap.put("bestseller",goodsList);
		goodsList=goodsDao.listGoods("newbook");
		goodsMap.put("newbook",goodsList);
		
		goodsList=goodsDao.listGoods("steadyseller");
		goodsMap.put("steadyseller",goodsList);
		
		//검색 단어 테이블에서 자주 검색되는 단어를 가지고 온다.
		ArrayList searchWordList=goodsDao.searchWordList();
		goodsMap.put("searchWordList",searchWordList);
		
		//팝업 정보 가지고 오기
		ArrayList popupList=goodsDao.popupList();
		goodsMap.put("popupList", popupList);
		
		return goodsMap;
	}
	
	public ArrayList keywordSearch(String keyword) throws Exception {
		ArrayList list=goodsDao.keywordSearch(keyword);
		return list;
	}
	
	public ArrayList searchGoods(String searchWord) throws Exception{
		ArrayList goodsList=goodsDao.searchGoods(searchWord);
		return goodsList;
	}
	
	public HashMap goodsDetail(String goods_id,int chapter,int pageNum) throws Exception {
		HashMap goodsMap=new HashMap();
		GoodsBean goodsBean = goodsDao.goodsDetail(goods_id);
		goodsMap.put("goods", goodsBean);
		ArrayList imageList =goodsDao.goodsDetailImage(goods_id);
		goodsMap.put("imageList", imageList);
		
		ReviewBean reviewBean=new ReviewBean();
		reviewBean.setGoods_id(goods_id);
		reviewBean.setChapter(chapter);
		reviewBean.setPageNum(pageNum);
		
		ArrayList reviewList =goodsDao.reviewList(reviewBean);
		goodsMap.put("reviewList", reviewList);
		
		//사용자 추천 도서 정보 가지고 오기
		HashMap recoMap=new HashMap();  //페이징 기능을 위해서   hashMap에 chapter와 pageNum을 저장해서 넘긴다.
		recoMap.put("chapter",chapter);
		recoMap.put("pageNum",pageNum);
		recoMap.put("goods_id",goods_id);
		ArrayList userRecoList=goodsDao.userRecoList(recoMap);
		goodsMap.put("userRecoList",userRecoList);
		return goodsMap;
	}
	
	public void addReview(ReviewBean reviewBean) throws Exception{
		goodsDao.insertReview(reviewBean);
	}
	
	//상세 검색 메서드
		public ArrayList detailSearch(HashMap condMap) throws Exception{
			ArrayList detail_search_list=goodsDao.detailSearch(condMap);
			return detail_search_list;
		}
		
	
	//사용자  추천 도서 정보 저장 메서드 
	public void addUserRecoGoods(UserRecoBean userRecoBean) throws Exception{
		goodsDao.addUserRecoGoods(userRecoBean);
	}
	
		
}
