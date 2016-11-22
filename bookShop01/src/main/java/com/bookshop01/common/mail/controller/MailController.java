package com.bookshop01.common.mail.controller;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@EnableAsync
public class MailController {
    @Autowired
    private MailService mailService;
 
    @RequestMapping(value = "/mail/sendMail.do", method = RequestMethod.GET)
    public void sendSimpleMail(HttpServletRequest request, HttpServletResponse response) 
                                                          throws Exception{
    	request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        //mailService.sendMail("x9103293@naver.com","�׽�Ʈ����","�׽�Ʈ�����Դϴ�.");
        StringBuffer sb = new StringBuffer();
 	   sb.append("<html><body>");
 		sb.append("<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>");
 		sb.append("<h1>"+"��ǰ�Ұ�"+"<h1><br />");
 		//sb.append("<a href='http://localhost:8090/bookshop01/ex6/goods.jsp' >");
 		sb.append("<a href='http://localhost:8090/bookshop01/goods/goodsDetail.do?goods_id=336'>");
 		sb.append("<img  src='http://localhost:8090/bookshop01/fileDownload.do?goods_id=336&fileName=good1_main_image.jpg' /> </a><br>");
 		sb.append("</a>");
 		sb.append("<a href='http://localhost:8090/bookshop01/goods/goodsDetail.do?goods_id=336'>��ǰ����</a>");
 		sb.append("</body></html>");
 		String str=sb.toString();
 		mailService.sendMail("x9103293@naver.com","�� ��ǰ�� �Ұ��մϴ�.",str);
      //  mailService.sendPreConfiguredMail("�׽�Ʈ �����Դϴ�.");
        out.print("������ ���½��ϴ�!!");
    }
    
    @RequestMapping(value = "/mail/adminSendMail.do", method = RequestMethod.POST)
    public void adminSendMail(HttpServletRequest request, HttpServletResponse response) throws Exception{ 
    	request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        
        String mail_receiver=request.getParameter("mail_receiver");
        String mail_title=request.getParameter("mail_title");
        String mail_content=request.getParameter("mail_content");
       
 		mailService.sendMail(mail_receiver,mail_title,mail_content);
        out.print("������ ���½��ϴ�!!");
    }
    
}


