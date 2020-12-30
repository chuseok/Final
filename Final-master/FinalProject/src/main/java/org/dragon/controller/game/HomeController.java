package org.dragon.controller.game;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.dragon.domain.game.DragonVO;
import org.dragon.domain.game.UserVO;
import org.dragon.domain.login.MemberVO;
import org.dragon.service.game.DragonService;
import org.dragon.service.game.MainService;
import org.dragon.service.login.MemberService;
import org.dragon.service.study.LearningService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.tst.NaverLoginBO;

import lombok.AllArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@Controller
@AllArgsConstructor
@Component
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private MainService service;
	private DragonService dragonService;
	private MemberService memberService;
	private LearningService learningservice;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	  @RequestMapping(value = "/", method = RequestMethod.GET) public String
	  home(Locale locale, Model model) {
	  logger.info("Welcome home! The client locale is {}.", locale);
	  
	  Date date = new Date(); DateFormat dateFormat =
	  DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	  
	  String formattedDate = dateFormat.format(date);
	  
	  model.addAttribute("serverTime", formattedDate );
	  
	  return "home"; }
	 
	
	@GetMapping("/main")
	public String main(Principal principal, Model model, HttpServletRequest request) throws ParseException {
		HttpSession session = request.getSession();
		if(principal!=null){
			String userId = principal.getName();
			Date last = service.getDate(userId);
			//service.updateDate(userId);
			Date now = new Date();
			long diff = now.getTime()-last.getTime();
			
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
					session.setAttribute("hungry", "드래곤의 포만감이 30% 이하입니다. 빨리 밥을 주세요!");
				}
				
				dragonService.updateDragon(dragon);
			}
			
			model.addAttribute("recentList", learningservice.getMyRecentList(userId));
			model.addAttribute("myList", learningservice.getMyList(userId));
			model.addAttribute("text", session.getAttribute("text"));
			model.addAttribute("hungry", session.getAttribute("hungry"));
		}
		

		return "main";
	}
	@RequestMapping("/vision")
	@ResponseBody
	public Map<String, String> androidTestWithRequestAndResponse(HttpServletRequest request){

        List<MemberVO> MemList = new ArrayList<MemberVO>();
        Map<String, String> result = new HashMap<String, String>();
        
        MemList = memberService.getList();
        
        String userId ="";
        String userPwd = "";
        
       
        for(int i=0;i<MemList.size();i++) {
        	userId = MemList.get(i).getUserId();
        	userPwd = MemList.get(i).getUserPwd();
        }

        result.put("userId",userId);
        result.put("userPwd",userPwd);

        return result;
}
	
	@RequestMapping(value="/home", method = { RequestMethod.GET, RequestMethod.POST })
	   public void loginInput(String error, String logout, Model model,HttpSession session) {
		logger.info("error: " + error);
		logger.info("logout: " + logout);
	      
	      if(error!=null) {
	         model.addAttribute("error", "�븘�씠�뵒 �삉�뒗 鍮꾨�踰덊샇 �삤瑜섏엯�땲�떎!");
	      }
	      if(logout!=null) {
	         model.addAttribute("logout", "濡쒓렇�븘�썐 �븯���뒿�땲�떎!");
	      }
	      String naverAuthUrl = NaverLoginBO.getAuthorizationUrl(session);
	        
	         
	        System.out.println("�꽕�씠踰�:" + naverAuthUrl);
	      model.addAttribute("url", naverAuthUrl);
	   }
	
	
}
