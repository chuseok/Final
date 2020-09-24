package org.dragon.service.word;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.dragon.domain.study.WordDTO;
import org.dragon.domain.study.WordVO;
import org.springframework.stereotype.Service;

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
					log.info("id�� ������ ����.");
					log.info("�Է��� ���� = " + wordDTO.getTitle() + ", �о�� ����" + readWordBook.getTitle());
					log.info("jsonDTOList = " + readWordBookList + "\n");
					readWordBookList.remove(readWordBook);
//					size--;
//					i--;
					
				} else if (readWordBook.getId().equals(wordDTO.getId()) && !readWordBook.getTitle().equals(wordDTO.getTitle())) {
					log.info("id�� ����." + readWordBook.getId() + "," + readWordBook.getTitle() + "\n");

				} else if (!readWordBook.getId().equals(wordDTO.getId()) && !readWordBook.getTitle().equals(wordDTO.getTitle())) {
					log.info("���� ����." + readWordBook.getId() + "," + readWordBook.getTitle());
					
				}
		
			}
			log.info("���� �ܾ��� : " + readWordBookList);
			
//			for (WordDTO w : readWordBookList) {
//				JSONArray resultArray = new JSONArray();
//				if(readWordBookList.isEmpty()) {
//					log.info("�������.");
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
//				System.out.println("������");
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
			// 1.oldArray���� Ǯ� object�� �ٽ� ��°�� �߰��� �� ���ο� ���� �߰�
			if (!oldArray.isEmpty()) {
//				log.info("oldArray : ������� ����");
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

//		log.info("���ο� obj= " + itemsObj);
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
