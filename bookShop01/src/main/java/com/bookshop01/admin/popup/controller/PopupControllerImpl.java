package com.bookshop01.admin.popup.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.admin.goods.service.AdminGoodsService;
import com.bookshop01.admin.popup.service.PopupService;
import com.bookshop01.admin.popup.vo.PopupBean;
import com.bookshop01.common.controller.BaseController;
import com.bookshop01.member.vo.MemberBean;

@Controller("adminPopupController")
@RequestMapping(value="/admin/popup")
public class PopupControllerImpl extends BaseController implements PopupController {
	@Autowired
	AdminGoodsService adminGoodsService;
	
	@Autowired
	PopupService popupServce;
	
	@RequestMapping(value="/adminPopupMain.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminGoodsMain(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String fileName=getFileName(request);
		ModelAndView mav = new ModelAndView(fileName);
		HttpSession session=request.getSession();
		session=request.getSession();
		session.setAttribute("side_menu", "admin_mode"); //마이페이지 사이드 메뉴로 설정한다.

		String _chapter=null,_pageNum=null,period;
		String _beginDate=null,_endDate=null,beginDate=null,endDate=null;
		int curChapter=0,curPageNum=0;
        _beginDate=request.getParameter("beginDate");
        _endDate=request.getParameter("endDate");
		_chapter=request.getParameter("chapter");
		_pageNum=request.getParameter("pageNum");
		
		if(_endDate==null){
			String [] temp=calcSearchPeriod().split(",");
			beginDate=temp[0];
			endDate=temp[1];
		}else{
			beginDate=_beginDate;
			endDate=_endDate;	
		}
		
		if(_chapter==null){
			curChapter=1;
		}else{
			curChapter=Integer.parseInt(_chapter);
		}
		if(_pageNum==null){
			curPageNum=1;
		}else{
			curPageNum=Integer.parseInt(_pageNum);
		}
		HashMap<String,Object> condMap=new HashMap<String,Object>();
		condMap.put("chapter",curChapter);
		condMap.put("pageNum",curPageNum);
		condMap.put("beginDate",beginDate);
		condMap.put("endDate", endDate);
		
		HashMap popupMap=new HashMap();
		ArrayList new_goods_list=adminGoodsService.listNewGoods(condMap);
		ArrayList popup_goods_list=popupServce.listPopupGoods(condMap);
		
		popupMap.put("new_goods_list",new_goods_list);
		popupMap.put("popup_goods_list",popup_goods_list);
		mav.addObject("popupMap", popupMap);
		
		String beginDate1[]=beginDate.split("-");
		String endDate2[]=endDate.split("-");
		mav.addObject("beginYear",beginDate1[0]);
		mav.addObject("beginMonth",beginDate1[1]);
		mav.addObject("beginDay",beginDate1[2]);
		mav.addObject("endYear",endDate2[0]);
		mav.addObject("endMonth",endDate2[1]);
		mav.addObject("endDay",endDate2[2]);
		
		mav.addObject("chapter", curChapter);
		mav.addObject("pageNum", curPageNum);
		return mav;
	}
	
	@RequestMapping(value="/addPopup.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public void addPopup(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String goods_id=request.getParameter("goods_id");
		String popup_type=request.getParameter("popup_type");
		String popup_message=request.getParameter("popup_message");
		String popup_imagename=request.getParameter("goods_fileName");
		
		System.out.println(goods_id);
		System.out.println(popup_type);
		System.out.println(popup_message);
		System.out.println(popup_imagename);
		
		//세션에서 회원 아이디를 얻는다.
		HttpSession session=request.getSession();
		MemberBean member_info=(MemberBean)session.getAttribute("member_info");
		String member_id=member_info.getMember_id();
		
		PopupBean popupBean=new PopupBean();
		popupBean.setGoods_id(goods_id);
		popupBean.setPopup_type(popup_type);
		popupBean.setPopup_message(popup_message);
		popupBean.setPopup_imagename(popup_imagename);
		popupBean.setMember_id(member_id);
		
		popupServce.addPopup(popupBean);
		
		out.print("팝업 정보를 추가했습니다.");
	}
	
	@RequestMapping(value="/deletePopup.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public void deletePopup(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String goods_id=request.getParameter("goods_id");
		
		popupServce.deletePopup(goods_id);
		out.print("팝업 정보를 해제 했습니다.!!");
		
	}
	
	
		
}
