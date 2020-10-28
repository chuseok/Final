package org.dragon.controller.word;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dragon.domain.study.WordDTO;
import org.dragon.service.word.WordService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

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
	}

	@PostMapping("/read")
	public String read(@RequestParam(value = "item") String item, @RequestParam(value = "wordTitle") String wordTitle,
			Principal userId, RedirectAttributes rttr) {
		log.info("read......");

		JSONArray array = JSONArray.fromObject(item);

		WordDTO readJson = new WordDTO();
		readJson.setId(userId.getName());
		readJson.setTitle(wordTitle);
		JSONArray oldArray = service.readJson(array, readJson);

		String result = oldArray.toString();
		Map<String, String> map = new HashMap<String, String>();
		map.put("item", item);
		map.put("oldItem", result);
		map.put("wordTitle", wordTitle);
		rttr.addFlashAttribute("map", map);
		return "redirect:/word/write";

	}

	@GetMapping("/write")
	public void write(Principal userId, RedirectAttributes rttr, HttpServletRequest req) {

		log.info("write ......");

		Map<String, Object> params = new HashMap<>();
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(req);
		if (flashMap != null) {
			params = (Map<String, Object>) flashMap.get("map");
			log.info("params....." + params);
			for (String s : params.keySet()) {
				log.info("Key : " + s + ", params.get(s) : " + params.get(s));
			}

			Object item = params.get("item");
			
			JSONArray array = JSONArray.fromObject(item);
			List<WordDTO> jsonDTO = service.stringToJson(params.get("oldItem").toString());
			log.info("jsonDTO : " + jsonDTO);
			log.info("array : " + array);
			
			WordDTO writeJson = new WordDTO();
			writeJson.setId(userId.getName());
			writeJson.setTitle(params.get("wordTitle").toString());
			
			service.writeJson(array, jsonDTO, writeJson);

			for (int i = 0; i < array.size(); i++) {
				JSONObject obj = (JSONObject) array.get(i);
				log.info(obj.get("word"));
			}

		}

	}
}
