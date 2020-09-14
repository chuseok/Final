package org.zerock.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.WordDTO;
import org.zerock.domain.WordVO;
import org.zerock.service.WordService;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/data")
public class DataController {
	
	private WordService wordsservice;
	
	
	

	
	
	
	

}
