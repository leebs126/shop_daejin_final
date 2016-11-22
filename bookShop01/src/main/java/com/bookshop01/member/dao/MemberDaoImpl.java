package com.bookshop01.member.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bookshop01.member.vo.MemberBean;

@Repository("memberDao")
public class MemberDaoImpl  implements MemberDao{
	@Autowired
	private SqlSession sqlSession;	
	public MemberBean login(MemberBean memberBean) throws Exception{
		MemberBean member=sqlSession.selectOne("mapper.member.login",memberBean);
	   return member;
	}
	
	public void addMember(MemberBean memberBean) throws Exception{
		sqlSession.insert("mapper.member.addMember",memberBean);
	}
	
	public void addMainSetting(MemberBean memberBean) throws Exception{
		HashMap typeMap=new HashMap();
		String id=memberBean.getMember_id();
		typeMap.put("member_id",id);
		
		for(int i=0;i<7;i++){
			if(i==0){
				typeMap.put("goods_type","review_book");
				typeMap.put("show_yn", "n");
			}else if(i==1){
				typeMap.put("goods_type","brand_book");
				typeMap.put("show_yn", "n");
			}else if(i==2){
				typeMap.put("goods_type","writer_book");
				typeMap.put("show_yn", "n");
			}else if(i==3){
				typeMap.put("goods_type","bestseller");
				typeMap.put("show_yn", "y");
			}else if(i==4){
				typeMap.put("goods_type","newbook");
				typeMap.put("show_yn", "y");
			}else if(i==5){
				typeMap.put("goods_type","discount_book");
				typeMap.put("show_yn", "n");
			}else if(i==6){
				typeMap.put("goods_type","steadyseller");
				typeMap.put("show_yn", "y");
			}
			
		    sqlSession.insert("mapper.member.addMainSetting",typeMap);		
		}
	}

}
