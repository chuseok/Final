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
		JSONObject wordObj;

		try {
			List<WordDTO> wordBookList = new ObjectMapper().readValue(
					new File("C:/temp/test01.json"),
					new TypeReference<List<WordDTO>>() {});

			for (int i = 0; i < wordBookList.size(); i++) {
				WordDTO wordBook = wordBookList.get(i);
				itemArray.clear();

				wordObj = new JSONObject();
				wordObj.put("id", wordBook.getId());
				wordObj.put("title", wordBook.getTitle());
				log.info("wordBook.getItem() : " + wordBook.getItem());
				
				for (WordVO w : wordBook.getItem()) {
					JSONObject itemObj = new JSONObject();
					itemObj.put("word", w.getWord());
					itemObj.put("meaning", w.getMeaning());
					itemArray.add(itemObj);
				}
				log.info("itemArray : " + itemArray);
				
				wordObj.put("item", itemArray);
				wordArray.add(wordObj);

				if (wordBook.getId().equals(wordDTO.getId()) && wordBook.getTitle().equals(wordDTO.getTitle())) {
					log.info("입력한 id와 title이 일치");
					wordBookList.remove(wordBook);
					
				} else if (wordBook.getId().equals(wordDTO.getId()) && !wordBook.getTitle().equals(wordDTO.getTitle())) {
					log.info("입력한 id만 일치" + wordBook.getId() + "," + wordBook.getTitle() + "\n");

				} else if (!wordBook.getId().equals(wordDTO.getId()) && !wordBook.getTitle().equals(wordDTO.getTitle())) {
					log.info("다름" + wordBook.getId() + "," + wordBook.getTitle());
					
				}
		
			}
			log.info("wordBookList : " + wordBookList);

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
