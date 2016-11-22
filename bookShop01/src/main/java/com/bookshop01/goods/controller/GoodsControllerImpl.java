package com.bookshop01.goods.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.common.controller.BaseController;
import com.bookshop01.goods.service.GoodsService;
import com.bookshop01.goods.vo.GoodsBean;
import com.bookshop01.goods.vo.ImageFileBean;
import com.bookshop01.member.vo.MemberBean;
import com.bookshop01.goods.vo.ReviewBean;
import com.bookshop01.goods.vo.UserRecoBean;

@Controller("goodsController")
@RequestMapping(value="/goods")
public class GoodsControllerImpl  extends BaseController implements GoodsController {
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping(value="/goodsDetail.do" ,method = RequestMethod.GET)
	public ModelAndView goodsDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String goods_id = request.getParameter("goods_id");
		
		String _chapter=request.getParameter("chapter");
		String _pageNum=request.getParameter("pageNum");
		int chapter=0,pageNum=0;
		if(_chapter==null){
			chapter=1;
		}else{
			chapter=Integer.parseInt(_chapter);
		}
		
		if(_pageNum==null){
			pageNum=1;
		}else{
			pageNum=Integer.parseInt(_pageNum);
		}
		
		
		String fileName=getFileName(request);
		HttpSession session=request.getSession();
		HashMap goodsMap=goodsService.goodsDetail(goods_id,chapter,pageNum);
		ModelAndView mav = new ModelAndView(fileName);
		mav.addObject("goodsMap", goodsMap);
		mav.addObject("chapter",chapter);
		mav.addObject("pageNum",pageNum);
		GoodsBean goodsBean=(GoodsBean)goodsMap.get("goods");
		add_goods_in_sticky(goods_id,goodsBean,session);
		return mav;
	}
	
	@RequestMapping(value="/keywordSearch.do" ,method = RequestMethod.GET)
	public void keywordSearch(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String keyword = request.getParameter("keyword");
		 System.out.println(keyword);
		if(keyword == null || keyword.equals(""))
		   return ;
	
		keyword = keyword.toUpperCase();
	    List keywordList =goodsService.keywordSearch(keyword);
	    
	    
			 // 제시어 개수 출력
	   PrintWriter out=response.getWriter();
	   out.print(keywordList.size());
	   out.print("|");
	   // 제시어 목록을 CSV 양식으로 출력
	   for(int i=0; i<keywordList.size(); i++){
		  String key = (String)keywordList.get(i);
		  out.print(key);
		  if(i<keywordList.size()-1) {
			   out.print(",");
		  }
	  }
		return ;
	}
	
	@RequestMapping(value="/searchGoods.do" ,method = RequestMethod.GET)
	public ModelAndView searchGoods(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String searchWord = request.getParameter("searchWord");
		String fileName=getFileName(request);
		ArrayList search_goods_list=goodsService.searchGoods(searchWord);
		ModelAndView mav = new ModelAndView(fileName);
		mav.addObject("search_goods_list", search_goods_list);
		return mav;
		
	}
	
	@RequestMapping(value="/addReview.do" ,method = RequestMethod.POST)
	public ModelAndView addReview(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String fileName=getFileName(request);
		ModelAndView mav = new ModelAndView(fileName);
		
		String review_title=request.getParameter("review_title");
		String review_content=request.getParameter("review_content");
		String review_pw=request.getParameter("review_pw");
		String goods_id=request.getParameter("goods_id");
		
		HttpSession session=request.getSession();
		MemberBean memberBean=(MemberBean)session.getAttribute("member_info");
		String member_id=(String)memberBean.getMember_id();
		
		ReviewBean reviewBean=new ReviewBean();
		reviewBean.setReview_title(review_title);
		reviewBean.setReview_content(review_content);
		reviewBean.setReview_pw(review_pw);
		reviewBean.setGoods_id(goods_id);
		reviewBean.setMember_id(member_id);
		
		goodsService.addReview(reviewBean);
		mav.setViewName("redirect:/goods/goodsDetail.do?goods_id="+goods_id);
		return mav;
		
	}
	
	@RequestMapping(value="/detailSeach.do" ,method = RequestMethod.GET)
	public ModelAndView detailSeach(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String fileName=getFileName(request);
		ModelAndView mav = new ModelAndView(fileName);
		
		String goods_title=request.getParameter("goods_title");
		String goods_writer=request.getParameter("goods_writer");
		String goods_publisher=request.getParameter("goods_publisher");
		String begin_pub_date=request.getParameter("begin_pub_date");
		String end_pub_date=request.getParameter("end_pub_date");
		
		HashMap condMap=new HashMap();
		condMap.put("goods_title", goods_title);
		condMap.put("goods_writer",goods_writer);
		condMap.put("goods_publisher",goods_publisher);
		condMap.put("begin_pub_date",begin_pub_date);
		condMap.put("end_pub_date",end_pub_date);
		
		ArrayList search_goods_list=goodsService.detailSearch(condMap);
		mav.addObject("search_goods_list",search_goods_list);
		mav.setViewName("/goods/searchGoods");
		return mav;
		
	}	
	

	@RequestMapping(value="/userRecoGoods.do" ,method = RequestMethod.POST)
	public ModelAndView userRecoGoods(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String fileName=getFileName(request);
		ModelAndView mav = new ModelAndView(fileName);
		
		HttpSession session=request.getSession();
		MemberBean memberBean=(MemberBean)session.getAttribute("member_info");
		String member_id=(String)memberBean.getMember_id();
		
		//processImageFile() 호출해서 이미지를 업로드한다.
		UserRecoBean userRecoBean=processImageFile(request,response);
		
		//사용자 추천 제품 데이터를 테이블에 추가한다.
		goodsService.addUserRecoGoods(userRecoBean);
		
		//사용자 추천 제품 데이터를 테이블에 추가한 후 다시 제품 상세 화면으로 redirect 한다.
		String goods_id=(String)userRecoBean.getGoods_id();
		mav.setViewName("redirect:/goods/goodsDetail.do?goods_id="+goods_id);
		return mav;
		
		
	}	
	
	private UserRecoBean  processImageFile(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String FILE_SERVER_DIR="C:\\user_reco_image_repo";
		String filePath=null;
		String encoding="utf-8";
		
		File uploadFile = null;
		ArrayList<ImageFileBean> fileList=new ArrayList<ImageFileBean>();
		HttpSession session=request.getSession();
		MemberBean member_info=(MemberBean)session.getAttribute("member_info");
		String reg_id=member_info.getMember_id();
		String parameter=null;
		String value=null;
		String fileName=null;
		String goods_id=null;
		
		UserRecoBean userRecoBean=new UserRecoBean();
		userRecoBean.setMember_id(reg_id); //로그인한 회원 아이디를 세션에서 가지고 와서 세팅한다.
		
		ArrayList<String> fileNameList=new ArrayList<String>();
		File currentRepoPath=new File(FILE_SERVER_DIR);

		//System.out.println(command);
			//String image_id=request.getParameter("image_id");
			fileName=request.getParameter("fileName");
			//deleteImage(image_id,goods_id,fileName);
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setRepository(currentRepoPath );
			factory.setSizeThreshold(1024*1024);
			
			ServletFileUpload upload=new ServletFileUpload(factory);
			
			List<?> items = upload.parseRequest(request);
			for(int i=0; i < items.size();i++){
				FileItem fileItem = (FileItem) items.get(i);
				
				if(fileItem.isFormField()){
					System.out.println(fileItem.getFieldName()+ "=" +fileItem.getString(encoding));
					if(fileItem.getFieldName().equals("goods_id")){
						goods_id=fileItem.getString(encoding);
						userRecoBean.setGoods_id(goods_id);
					}else if(fileItem.getFieldName().equals("reco_goods_title")){
						userRecoBean.setReco_goods_title(fileItem.getString(encoding));
					}else if(fileItem.getFieldName().equals("reco_goods_content")){
						userRecoBean.setReco_goods_content(fileItem.getString(encoding));
					}
					
					
				}else{
					System.out.println("파라미터명:"+fileItem.getFieldName());
					System.out.println("파일명:"+fileItem.getName());
					System.out.println("파일크기:"+fileItem.getSize( ) + "bytes");
					filePath=FILE_SERVER_DIR+"\\"+goods_id;
					new  File(filePath).mkdir();
					
					fileName=fileItem.getName();
					String fileType=fileItem.getFieldName();
					userRecoBean.setReco_goods_imagename(fileName);
					
					//fileList.add(imageFileBean);
					
					//업로드한 파일이 존재하는 경우
					if(fileItem.getSize() > 0){
						int idx = fileItem.getName().lastIndexOf("\\");
						if(idx ==-1){
							idx = fileItem.getName().lastIndexOf("/");
						}
						 fileName = fileItem.getName().substring(idx+1);
						try{
							System.out.println("저장 위치:"+filePath);
							uploadFile = new  File(filePath+"\\"+fileName);
							fileItem.write(uploadFile);
						}catch(IOException e){
							e.printStackTrace();
						}
					}
				
				}
			
			}
		return userRecoBean;
	}		
	
	private void add_goods_in_sticky(String goods_id,GoodsBean goodsBean,HttpSession session){
		boolean already_existed=false;
		ArrayList<GoodsBean> sticky_goods_list; //최근 본 상품 저장 ArrayList
		sticky_goods_list=(ArrayList<GoodsBean>)session.getAttribute("sticky_goods_list");
		
		if(sticky_goods_list!=null){
			if(sticky_goods_list.size()<4){ //미리본 상품 리스트에 상품개수가 세개 이하인 경우
				for(int i=0; i<sticky_goods_list.size();i++){
					GoodsBean _goodsBean=(GoodsBean)sticky_goods_list.get(i);
					if(goods_id.equals(_goodsBean.getGoods_id())){
						already_existed=true;
						break;
					}
				}
				if(already_existed==false){
					sticky_goods_list.add(goodsBean);
				}
			}
			
		}else{
			sticky_goods_list =new ArrayList<GoodsBean>();
			sticky_goods_list.add(goodsBean);
			
		}
		session.setAttribute("sticky_goods_list",sticky_goods_list);
		session.setAttribute("sticky_list_num", sticky_goods_list.size());
	}
}
