package org.zerock.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.JsonDTO;
import org.zerock.domain.WordDTO;
import org.zerock.service.WordService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@Log4j
@RequestMapping("/word/*")
@AllArgsConstructor
public class WordController {

	private WordService service;

	@GetMapping("/wordList")
	public void getWordList(Model model) {
		log.info("wordList ......");
//		model.addAttribute("word", service.createJson(word));
	}
	
	@PostMapping("/read")
	public String read(@RequestParam(value="item") String item, @RequestParam(value="wordTitle") String wordTitle, Principal userId, RedirectAttributes rttr) {
		log.info("read......");
		
		JSONArray array = JSONArray.fromObject(item);

//		JSONArray wordArray = service.readJson(array, wordTitle);
//		String result = wordArray.toString();
//		rttr.addAttribute("item", result);
		JsonDTO readJson = new JsonDTO();
		readJson.setId(userId.getName());
		readJson.setTitle(wordTitle);
		JSONArray oldArray = service.readJson(array, readJson);
		
		String result = oldArray.toString();
		rttr.addAttribute("item", item);
		rttr.addAttribute("oldItem", result);
		rttr.addAttribute("wordTitle", wordTitle);
		return "redirect:/word/write";
	}

	@GetMapping("/write")
	public void write(@RequestParam(value="item") String item, @RequestParam(value="oldItem") String oldItem, @RequestParam(value="wordTitle") String wordTitle, Principal userId, RedirectAttributes rttr) {
		/*
		 * String json = parameters.get("items").toString(); String json2 =
		 * parameters.get("wordTitle").toString(); log.info(json2 +"json은 : " + json);
		 * service.writeJson("\"" + json2+ "\":" +json);
		 */
		log.info("write ......");
		
		JSONArray array = JSONArray.fromObject(item);
//		JSONArray oldArray = JSONArray.fromObject(oldItem);
		List<JsonDTO> jsonDTO = service.stringToJson(oldItem);
		log.info("jsonDTO확인1 = " + jsonDTO);
		
		JsonDTO writeJson = new JsonDTO();
		writeJson.setId(userId.getName());
		writeJson.setTitle(wordTitle);
		service.writeJson(array, jsonDTO, writeJson);

		for(int i=0; i<array.size(); i++){
			JSONObject obj = (JSONObject)array.get(i);
			log.info(obj.get("word"));
		}
		
		
		//모달 추가해야함
		/*JSONArray array = new JSONArray();
		array = JSONArray.writeJSONString(jsonData);
		log.info("word : " + jsonData. word);
		log.info("meaning : " + meaning);
		service.createJson(word);*/
	}
	
	/*
	 * @PostMapping("/write") public void write(@RequestParam Map<String, Object>
	 * parameters, @RequestParam(value="wordTitle") String wordTitle,
	 * RedirectAttributes rttr) { String json = parameters.get("items").toString();
	 * String json2 = parameters.get("wordTitle").toString(); log.info(json2
	 * +"json은 : " + json); service.writeJson("\"" + json2+ "\":" +json);
	 * 
	 * //모달 추가 JSONArray array = new JSONArray(); array =
	 * JSONArray.writeJSONString(jsonData); log.info("word : " + jsonData. word);
	 * log.info("meaning : " + meaning); service.createJson(word); }
	 */

}
