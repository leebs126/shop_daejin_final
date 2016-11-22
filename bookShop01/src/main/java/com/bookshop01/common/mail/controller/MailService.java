package com.bookshop01.common.mail.controller;


import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailService {
 
	@Autowired
	 private JavaMailSender mailSender;
	
    @Autowired
    private SimpleMailMessage preConfiguredMessage;
 
    @Async
    public void sendMail(String to, String subject, String body)
    {
    	MimeMessage message = mailSender.createMimeMessage();
    	 
    	  try {
    	   MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    	   messageHelper.setSubject(subject);
    	   messageHelper.setTo(to);
    	   //messageHelper.setCc("x9103293@naver.com");
    	  // messageHelper.setFrom("x9103293@naver.com");
    	   messageHelper.setText(body,true );
    	   mailSender.send(message);
    	  }catch(Exception e){
    		  e.printStackTrace();
    	  }
    	
        /*SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);
        message.
        mailSender.send(message);
    	
    	MimeMailMessage msg=new MimeMailMessage();*/
    	
    }
 
    @Async
    public void sendPreConfiguredMail(String message) {
            SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
            mailMessage.setText(message);
            mailSender.send(mailMessage);
    }
}

