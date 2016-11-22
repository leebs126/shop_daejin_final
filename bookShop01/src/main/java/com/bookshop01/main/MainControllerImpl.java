package com.bookshop01.main;

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

import com.bookshop01.common.controller.BaseController;
import com.bookshop01.goods.service.GoodsService;
import com.bookshop01.goods.vo.GoodsBean;
import com.bookshop01.member.vo.MemberBean;

@Controller("mainController")
@RequestMapping(value="/main")
public class MainControllerImpl extends BaseController {
	@Autowired
	private GoodsService goodsService;

	@RequestMapping(value="/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HashMap<String,ArrayList<GoodsBean>> goodsMap=null;
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String fileName=getFileName(request);
		mav.setViewName(fileName);
		
		session=request.getSession();
		session.setAttribute("side_menu", "user");
		
		//boolean isLogOn=(Boolean)session.getAttribute("isLogOn");
		MemberBean memberBean=(MemberBean)session.getAttribute("member_info");
		//�α��� ���¿� ���� �α׾ƿ� ������ �� �и��ؼ� ���� ȭ�� ���� ��ȸ�Ѵ�.
		if(memberBean!=null){ //�α��� ����
			goodsMap=goodsService.listGoods(memberBean);
		}else{ //�α׾ƿ� ����
			session.setAttribute("isLogOn", false);
			goodsMap=goodsService.listGoods();	
		}
		
		
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
}
