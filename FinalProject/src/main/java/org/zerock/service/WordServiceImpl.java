package org.zerock.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Service;
import org.study.domain.WordDTO;
import org.study.domain.WordVO;

import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
@Log4j
@AllArgsConstructor
public class WordServiceImpl implements WordService {

	@Override
	public JSONArray readJson(JSONArray jsonArray, WordDTO wordDTO) {

		log.info("readJson.....");

		JSONArray wordArray = new JSONArray();
		JSONArray itemArray = new JSONArray();
		
		JSONArray newArray = new JSONArray();
		JSONObject oldObj = null;

		Gson gson = new Gson();
		JSONObject wordObj;

		Reader reader;
		try {
			List<WordDTO> readWordBookList = new ObjectMapper().readValue(new File("C:/temp/test01.json"),
					new TypeReference<List<WordDTO>>() {});

			int size = readWordBookList.size();

			for (int i = 0; i < size; i++) {

				WordDTO readWordBook = readWordBookList.get(i);
				itemArray.clear();
				
				int removedIndex = 0;
				/*
				 * log.info("id : " + str.getId()); log.info("title : " + str.getTitle());
				 * log.info("item : " + str.getItem()); for(ItemType item: str.getItem()) {
				 * log.info("word : " + item.getWord()); log.info("meaning : " +
				 * item.getMeaning()); }
				 */
				 

				wordObj = new JSONObject();
				wordObj.put("id", readWordBook.getId());
				wordObj.put("title", readWordBook.getTitle());
				log.info("readWordBook.getItem() : " + readWordBook.getItem());
				for (WordVO w : readWordBook.getItem()) {
					JSONObject itemObj = new JSONObject();
					itemObj.put("word", w.getWord());
					itemObj.put("meaning", w.getMeaning());
					itemArray.add(itemObj);
					
				}
				log.info("itemArray : " + itemArray);
				
				wordObj.put("item", itemArray);
				wordArray.add(wordObj);

				if (readWordBook.getId().equals(wordDTO.getId()) && readWordBook.getTitle().equals(wordDTO.getTitle())) {
					log.info("id와 제목이 같음.");
					log.info("입력한 제목 = " + wordDTO.getTitle() + ", 읽어온 제목" + readWordBook.getTitle());
					log.info("jsonDTOList = " + readWordBookList + "\n");
					readWordBookList.remove(readWordBook);
//					size--;
//					i--;
					
				} else if (readWordBook.getId().equals(wordDTO.getId()) && !readWordBook.getTitle().equals(wordDTO.getTitle())) {
					log.info("id가 같음." + readWordBook.getId() + "," + readWordBook.getTitle() + "\n");

				} else if (!readWordBook.getId().equals(wordDTO.getId()) && !readWordBook.getTitle().equals(wordDTO.getTitle())) {
					log.info("같지 않음." + readWordBook.getId() + "," + readWordBook.getTitle());
					
				}
		
			}
			log.info("남은 단어장 : " + readWordBookList);
			
//			for (WordDTO w : readWordBookList) {
//				JSONArray resultArray = new JSONArray();
//				if(readWordBookList.isEmpty()) {
//					log.info("비어있음.");
//				}
//				
//				oldObj = new JSONObject();
//				oldObj.put("id", w.getId());
//				oldObj.put("title", w.getTitle());
//				
//				for (WordVO item : w.getItem()) {
//					
//					JSONObject itemObj = new JSONObject();
//					itemObj.put("word", item.getWord());
//					itemObj.put("meaning", item.getMeaning());
//					
//					resultArray.add(itemObj);
//				}
//				System.out.println("넣은후");
//				oldObj.put("item", resultArray);
//				
//				newArray.add(oldObj);
//
//			}

		} catch (IOException e1) {
			e1.printStackTrace();
		}

		return wordArray;
	}

	@Override
	public void writeJson(JSONArray jsonArray, List<WordDTO> oldArray, WordDTO jsonDTO) {
		log.info("writeJson.....");

		JSONObject itemsObj = new JSONObject();
		JSONArray itemArray;
		JSONArray itemsArray = new JSONArray();

		try {
			// 1.oldArray값을 풀어서 object로 다시 통째로 추가한 후 새로운 값을 추가
			if (!oldArray.isEmpty()) {
//				log.info("oldArray : 비어있지 않음");
				for(WordDTO j:oldArray) {
					itemArray = new JSONArray();
					itemsObj.put("id", j.getId());
					itemsObj.put("title", j.getTitle());
				
					for (WordVO item : j.getItem()) {
						JSONObject itemObj = new JSONObject();
						itemObj.put("word", item.getWord());
						itemObj.put("meaning", item.getMeaning());
						itemArray.add(itemObj);
					}
					itemsObj.put("item", itemArray);
					itemsArray.add(itemsObj);
				}
			}

				itemsObj.put("id", jsonDTO.getId());
				itemsObj.put("title", jsonDTO.getTitle());
				itemsObj.put("item", jsonArray);

				itemsArray.add(itemsObj);

			
			BufferedWriter writer = new BufferedWriter(
					new OutputStreamWriter(new FileOutputStream("C:\\temp\\test01.json"), "utf-8"));

			writer.write(itemsArray.toString());
			writer.flush();
			writer.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

//		log.info("새로운 obj= " + itemsObj);
//		log.info("itemsArray= " + itemsArray + "\n");

	}

	@Override
	public List<WordDTO> stringToJson(String result) {
		List<WordDTO> jsonDTOList = null;
		try {
			jsonDTOList = new ObjectMapper().readValue(result,
					new TypeReference<List<WordDTO>>() {});
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	
		jsonDTOList.forEach(System.out::println);
		log.info("\n");
		return jsonDTOList;
		
	}
	
	
}
