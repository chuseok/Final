package org.dragon.android.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dragon.domain.game.DragonVO;
import org.dragon.domain.login.AuthVO;
import org.dragon.domain.login.MemberVO;
import org.dragon.service.game.DragonService;
import org.dragon.service.game.MainService;
import org.dragon.service.login.MemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/android/member")
@RestController("android.controller.MemberController")
@Log4j
@AllArgsConstructor
public class MemberController {

    MemberService memberService;
    MainService mainService;
    DragonService dragonService;
	
	@GetMapping(value = "/getList")
	public List<Map<String, String>> get(HttpServletRequest request) {

        List<MemberVO> MemList = new ArrayList<MemberVO>();
        List<Map<String, String>> result = new ArrayList<Map<String, String>>();
        
        MemList = memberService.getList();
        
        
        for(int i=0;i<MemList.size();i++) {
            Map<String, String> map = new HashMap<String, String>();
            String userId = MemList.get(i).getUserId();
            String userName = MemList.get(i).getUserName();
            map.put("userId", userId);
            map.put("userName", userName);
            
            result.add(map);
        }
        
        return result;
        
    }

	
	@PostMapping(value = "/signup")
	public Map<String, String> register(HttpServletRequest request) {
		
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userEmail = request.getParameter("userEmail");
		String userPhone = request.getParameter("userPhone");
		String userBirth = request.getParameter("userBirth");
		
		MemberVO member = new MemberVO();
		member.setUserName(userName);
		member.setUserId(userId);
		member.setUserPwd(userPwd);
		member.setEmail(userEmail);
		member.setPhoneNo(userPhone);
		member.setBirthday(userBirth);
		
		AuthVO auth = new AuthVO();
		auth.setAuth("ROLE_MEMBER");
		auth.setUserId(userId);
		
		System.out.println(member.getUserName());
		Map<String, String> map = new HashMap<String, String>();

		int insertMemCount = memberService.register(member);
		int insertAuthCount = memberService.register(auth);
		
		if(insertMemCount == 1 && insertAuthCount == 1) {
			map.put("insertResult", "success");
		} else {
			map.put("insertResult", "error");
		}
		
		return map;
		
	}
	@PostMapping(value = "/getLastConn")
	public Map<String, String> getLastConnection(HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		String userId = request.getParameter("userId");
		
		Date lastConn = mainService.getDate(userId);
		Date now = new Date();
		
		long diff = now.getTime()-lastConn.getTime();
		long sec = diff/1000%60;
		long min = diff/(1000*60)%60;
		long hour = diff/(1000*60*60)%24;
		long day = diff/(1000*60*60*24);
		
		if(sec>0&&hour==0)
			result.put("connectionAlert", min+"분 "+sec+"초만에 접속하였습니다.");
		else if(hour>0&&day==0)
			result.put("connectionAlert", hour+"시간 "+min+"분만에 접속하였습니다.");
		else if(day>0)
			result.put("connectionAlert", day+"일 "+hour+"시간만에 접속하였습니다.");
		
		if(diff<1000*60*60*24) {//1일이상 미접속시 
			/*if(diff<1000*60) {//test*/
			diff = 0;
		}else {
			diff /= 1000*60*10;//10분마다 1씩 감소
		}
		
		List<DragonVO> list = dragonService.getAllDragonByUser(userId);
		for(DragonVO dragon : list) {
			int val = (int) (dragon.getFoodValue()-diff);
			if(val<0) {
				dragon.setFoodValue(0);
			}else {
				dragon.setFoodValue(val);
			}
			if(val<30) {
				result.put("hungryAlert", "드래곤의 포만감이 30% 이하입니다. 빨리 밥을 주세요!");
			}else {
				result.put("hungryAlert", null);
			}
			
			dragonService.updateDragon(dragon);//포만감 감소
		}
		
		return result;
	}
	
}
