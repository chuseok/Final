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
import org.zerock.domain.JsonDTO;
import org.zerock.domain.WordDTO;

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
	public WordDTO createJson(WordDTO word) {//�̰� �Ⱦ�!!!!!!!!!!!
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
		itemsObj.put("id", "hansol");
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
	public JSONArray readJson(JSONArray jsonArray, String wordTitle) {

		log.info("readJson.....");

		JSONArray wordArray = new JSONArray();
		JSONArray itemArray = new JSONArray();
		
		JSONArray newArray = new JSONArray();
		JSONObject oldObj = null;

		Gson gson = new Gson();
		JSONObject wordObj;
		String myId = "hansol";

//		BufferedReader reader;
		Reader reader;
		try {
//			reader = Files.newBufferedReader(Paths.get("C:\\temp\\test01.json"), StandardCharsets.UTF_8);

			List<JsonDTO> jsonDTOList = new ObjectMapper().readValue(new File("C:/temp/test01.json"),
					new TypeReference<List<JsonDTO>>() {});

			int size = jsonDTOList.size();

			for (int i = 0; i < size; i++) {

				JsonDTO str = jsonDTOList.get(i);
				
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

				if (str.getId().equals(myId) && str.getTitle().equals(wordTitle)) {
					log.info("id�� ������ ����." + str.getId() + "," + str.getTitle());
					log.info("�Է��� ���� = " + wordTitle + ", �о�� ����" + str.getTitle());
					log.info("jsonDTOList = " + jsonDTOList + "\n");
					jsonDTOList.remove(str);
					size--;
					i--;
					
				} else if (str.getId().equals("hansol") && !str.getTitle().equals(wordTitle)) {
					log.info("id�� ����." + str.getId() + "," + str.getTitle() + "\n");

				} else if (!str.getId().equals("hansol") && !str.getTitle().equals(wordTitle)) {
					log.info("���� ����." + str.getId() + "," + str.getTitle());
					
				}
		
			}
			log.info("���� �ܾ��� Ȯ�� : " + jsonDTOList);
			
			for (JsonDTO j : jsonDTOList) {
				JSONArray resultArray = new JSONArray();
				if(jsonDTOList.isEmpty()) {
					log.info("�������.");
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
				System.out.println("������");
				oldObj.put("item", resultArray);
				
				newArray.add(oldObj);

				log.info("write�� �Ѱ���: " + oldObj + "\n");
				log.info("write�� �Ѱ���2: " + newArray + "\n");
				
			}

		} catch (IOException e1) {
			e1.printStackTrace();
		}

		return newArray;
	}

	@Override
	public void writeJson(JSONArray jsonArray, List<JsonDTO> oldArray, String wordTitle) {
		log.info("writeJson.....");

		JSONObject itemsObj = new JSONObject();
		JSONArray itemArray;
		JSONArray itemsArray = new JSONArray();

		try {
			// 1.oldArray���� Ǯ� object�� �ٽ� ��°�� �߰��� �� ���ο� ���� �߰�
			if (!oldArray.isEmpty()) {
				for(JsonDTO j:oldArray) {
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

			// 2.id�� title���� �޾ƿͼ� �ְų� �������� ��������
			itemsObj.put("id", "hansol");
			itemsObj.put("title", wordTitle);
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

		log.info("���ο� obj= " + itemsObj);
		log.info("itemsArray= " + itemsArray + "\n");

	}

	@Override
	public List<JsonDTO> stringToJson(String result) {
		List<JsonDTO> jsonDTOList = null;
		try {
			jsonDTOList = new ObjectMapper().readValue(result,
					new TypeReference<List<JsonDTO>>() {});
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	
		jsonDTOList.forEach(System.out::println);
		log.info("\n");
		return jsonDTOList;
		
	}
	
	
}
