package org.zerock.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Service;
import org.zerock.domain.ItemType;
import org.zerock.domain.ReadFileDTO;
import org.zerock.domain.WordVO;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
@Log4j
@AllArgsConstructor
public class WordServiceImpl implements WordService {

	@Override
	public WordVO createJson(WordVO word, String userId) {//이거 안씀!!!!!!!!!!!
		JSONObject itemsObj = new JSONObject();
		JSONObject itemObj = new JSONObject();
		JSONObject wordInfo = new JSONObject();
		JSONArray itemArray = new JSONArray();
		JSONArray idArray = new JSONArray();
		wordInfo.put("word", word.getWord());
		wordInfo.put("meaning", word.getMeaning());
		itemArray.add(wordInfo);
		itemObj.put("item", itemArray);
		itemsObj.put("items", itemObj);
		itemsObj.put("id", userId);
		idArray.add(itemsObj);

		try {
			BufferedWriter out = new BufferedWriter(
					new OutputStreamWriter(new FileOutputStream("C:\\temp\\test01.json"), "UTF-8"));
			out.write(idArray.toString());
			out.flush();
			out.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		log.info(itemsObj);
		
		return word;
	}

	@Override
	public JSONArray readJson(JSONArray jsonArray, ReadFileDTO jsonDTO) {

		log.info("readJson.....");

		JSONArray wordArray = new JSONArray();
		JSONArray itemArray = new JSONArray();
		
		JSONArray newArray = new JSONArray();
		JSONObject oldObj = null;

		Gson gson = new Gson();
		JSONObject wordObj;

//		BufferedReader reader;
		Reader reader;
		try {
//			reader = Files.newBufferedReader(Paths.get("C:\\temp\\test01.json"), StandardCharsets.UTF_8);

			List<ReadFileDTO> jsonDTOList = new ObjectMapper().readValue(new File("C:/temp/test01.json"),
					new TypeReference<List<ReadFileDTO>>() {});

			int size = jsonDTOList.size();

			for (int i = 0; i < size; i++) {

				ReadFileDTO str = jsonDTOList.get(i);
				
				int removedIndex = 0;
				/*
				 * log.info("id : " + str.getId()); log.info("title : " + str.getTitle());
				 * log.info("item : " + str.getItem()); for(ItemType item: str.getItem()) {
				 * log.info("word : " + item.getWord()); log.info("meaning : " +
				 * item.getMeaning()); }
				 */
				 

				wordObj = new JSONObject();

				wordObj.put("id", str.getId());
				wordObj.put("title", str.getTitle());

				for (ItemType item : str.getItem()) {
					JSONObject itemObj = new JSONObject();
					itemObj.put("word", item.getWord());
					itemObj.put("meaning", item.getMeaning());
					itemArray.add(itemObj);
				}

				wordObj.put("item", itemArray);
				wordArray.add(wordObj);

				if (str.getId().equals(jsonDTO.getId()) && str.getTitle().equals(jsonDTO.getTitle())) {
					log.info("id와 제목이 같음." + str.getId() + "," + str.getTitle());
					log.info("입력한 제목 = " + jsonDTO.getTitle() + ", 읽어온 제목" + str.getTitle());
					log.info("jsonDTOList = " + jsonDTOList + "\n");
					jsonDTOList.remove(str);
					size--;
					i--;
					
				} else if (str.getId().equals(jsonDTO.getId()) && !str.getTitle().equals(jsonDTO.getTitle())) {
					log.info("id가 같음." + str.getId() + "," + str.getTitle() + "\n");

				} else if (!str.getId().equals(jsonDTO.getId()) && !str.getTitle().equals(jsonDTO.getTitle())) {
					log.info("같지 않음." + str.getId() + "," + str.getTitle());
					
				}
		
			}
			log.info("남은 단어장 확인 : " + jsonDTOList);
			
			for (ReadFileDTO j : jsonDTOList) {
				JSONArray resultArray = new JSONArray();
				if(jsonDTOList.isEmpty()) {
					log.info("비어있음.");
				}
				
				oldObj = new JSONObject();
				oldObj.put("id", j.getId());
				oldObj.put("title", j.getTitle());
				
				for (ItemType item : j.getItem()) {
					
					JSONObject itemObj = new JSONObject();
					itemObj.put("word", item.getWord());
					itemObj.put("meaning", item.getMeaning());
					
					resultArray.add(itemObj);
				}
				System.out.println("넣은후");
				oldObj.put("item", resultArray);
				
				newArray.add(oldObj);

				log.info("write에 넘겨줌: " + oldObj + "\n");
				log.info("write에 넘겨줌2: " + newArray + "\n");
				
			}

		} catch (IOException e1) {
			e1.printStackTrace();
		}

		return newArray;
	}

	@Override
	public void writeJson(JSONArray jsonArray, List<ReadFileDTO> oldArray, ReadFileDTO jsonDTO) {
		log.info("writeJson.....");

		JSONObject itemsObj = new JSONObject();
		JSONArray itemArray;
		JSONArray itemsArray = new JSONArray();

		try {
			// 1.oldArray값을 풀어서 object로 다시 통째로 추가한 후 새로운 값을 추가
			if (!oldArray.isEmpty()) {
				for(ReadFileDTO j:oldArray) {
					itemArray = new JSONArray();
					itemsObj.put("id", j.getId());
					itemsObj.put("title", j.getTitle());
				
					for (ItemType item : j.getItem()) {
						JSONObject itemObj = new JSONObject();
						itemObj.put("word", item.getWord());
						itemObj.put("meaning", item.getMeaning());
						itemArray.add(itemObj);
					}
					itemsObj.put("item", itemArray);
					itemsArray.add(itemsObj);
				}
			}

			// 2.id와 title값을 받아와서 넣거나 세션으로 가져오기
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

		log.info("새로운 obj= " + itemsObj);
		log.info("itemsArray= " + itemsArray + "\n");

	}

	@Override
	public List<ReadFileDTO> stringToJson(String result) {
		List<ReadFileDTO> jsonDTOList = null;
		try {
			jsonDTOList = new ObjectMapper().readValue(result,
					new TypeReference<List<ReadFileDTO>>() {});
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	
		jsonDTOList.forEach(System.out::println);
		log.info("\n");
		return jsonDTOList;
		
	}
	
	
}
