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
	
	//�α��� ���� ȭ�鿡 ǥ�õ� ��ǰ ������ �˾� ���� ��ȸ ���
	public HashMap<String,ArrayList<GoodsBean>> listGoods(MemberBean memberBean) throws Exception {
		String member_id=memberBean.getMember_id();
		
		ArrayList settingList=goodsDao.mainSettingList(member_id);
		
		HashMap<String,ArrayList<GoodsBean>> goodsMap=new HashMap<String,ArrayList<GoodsBean>>();
		//���� t_shoping_main_setting���̺��� 7����  ��ǰ Ÿ���� ���ͼ�
		//�� ��ǰ Ÿ�� ���� t_goods_info������ǰ�� ���� ��ȸ�� �� 
		//ArrayList�� ���� ������ �� hashMap�� �ٽ� �����Ѵ�.
		for(int i=0;i<settingList.size();i++){
			GoodsBean goodsBean=(GoodsBean)settingList.get(i);
			String goods_type=(String)goodsBean.getGoods_type();
			ArrayList goodsList=goodsDao.listGoods(goods_type);
			goodsMap.put(goods_type,goodsList);
		}
		
		//�˾� ���� ������ ����
		ArrayList popupList=goodsDao.popupList();
		goodsMap.put("popupList", popupList);
		
		return goodsMap;
	}
	
	//���� ȭ�鿡 ǥ�õ� ��ǰ ������ �˾� ���� ��ȸ ���
	public HashMap<String,ArrayList<GoodsBean>> listGoods() throws Exception {
		HashMap<String,ArrayList<GoodsBean>> goodsMap=new HashMap<String,ArrayList<GoodsBean>>();
		ArrayList goodsList=goodsDao.listGoods("bestseller");
		goodsMap.put("bestseller",goodsList);
		goodsList=goodsDao.listGoods("newbook");
		goodsMap.put("newbook",goodsList);
		
		goodsList=goodsDao.listGoods("steadyseller");
		goodsMap.put("steadyseller",goodsList);
		
		//�˻� �ܾ� ���̺��� ���� �˻��Ǵ� �ܾ ������ �´�.
		ArrayList searchWordList=goodsDao.searchWordList();
		goodsMap.put("searchWordList",searchWordList);
		
		//�˾� ���� ������ ����
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
		
		//����� ��õ ���� ���� ������ ����
		HashMap recoMap=new HashMap();  //����¡ ����� ���ؼ�   hashMap�� chapter�� pageNum�� �����ؼ� �ѱ��.
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
	
	//�� �˻� �޼���
		public ArrayList detailSearch(HashMap condMap) throws Exception{
			ArrayList detail_search_list=goodsDao.detailSearch(condMap);
			return detail_search_list;
		}
		
	
	//�����  ��õ ���� ���� ���� �޼��� 
	public void addUserRecoGoods(UserRecoBean userRecoBean) throws Exception{
		goodsDao.addUserRecoGoods(userRecoBean);
	}
	
		
}
