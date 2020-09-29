package org.dragon.service.study;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.dragon.domain.study.StudyDTO;
import org.dragon.domain.study.WordDTO;
import org.dragon.domain.study.WordVO;
import org.dragon.mapper.study.StudyMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
@Log4j
@AllArgsConstructor
public class LearningServiceImple implements LearningService {

	private StudyMapper mapper;
	
	@Override
	public JSONArray readAllJson() {

		log.info("read JsonFile.....");

		JSONArray wordArray = new JSONArray();
		JSONArray itemArray = new JSONArray();

		JSONObject wordObj;

		try {

			List<WordDTO> jsonDTOList = new ObjectMapper().readValue(new File("C:/temp/test01.json"),
					new TypeReference<List<WordDTO>>() {
					});

			int size = jsonDTOList.size();

			for (int i = 0; i < size; i++) {

				WordDTO str = jsonDTOList.get(i);

				/*
				 * log.info("id : " + str.getId()); log.info("title : " + str.getTitle());
				 * log.info("item : " + str.getItem());
				 */

				wordObj = new JSONObject();

				wordObj.put("id", str.getId());
				wordObj.put("title", str.getTitle());

				for (WordVO item : str.getItem()) {
					JSONObject itemObj = new JSONObject();
					itemObj.put("word", item.getWord());
					itemObj.put("meaning", item.getMeaning());
					itemObj.put("learningRate", item.getLearningRate());
					itemArray.add(itemObj);
				}

				wordObj.put("item", itemArray);
				wordArray.add(wordObj);
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return wordArray;
	}

	@Override
	public List<WordDTO> getAllWordList() {
		List<WordDTO> jsonDTOList = null;
		try {
			jsonDTOList = new ObjectMapper().readValue(new File("C:/temp/test01.json"),
					new TypeReference<List<WordDTO>>() {
					});

		} catch (IOException e) {

			e.printStackTrace();
		}
		jsonDTOList.forEach(System.out::println);
		return jsonDTOList;
	}
	
	
	@Override
	public List<WordDTO> getAllMyWordList() {
		List<WordDTO> jsonDTOList = null;
		try {
			jsonDTOList = new ObjectMapper().readValue(new File("C:/temp/test02.json"),
					new TypeReference<List<WordDTO>>() {
					});

		} catch (IOException e) {

			e.printStackTrace();
		}
		jsonDTOList.forEach(System.out::println);
		return jsonDTOList;
	}
	

	@Override
	public JSONArray getWordJsonArray(String id, String title) {
		// log.info("get wordList.....");

		JSONArray wordArray = new JSONArray();
		JSONArray itemArray = new JSONArray();

		JSONObject wordObj;

		try {
			List<WordDTO> jsonDTOList = new ObjectMapper().readValue(new File("C:/temp/test01.json"),
					new TypeReference<List<WordDTO>>() {
					});
			int size = jsonDTOList.size();
			for (int i = 0; i < size; i++) {
				WordDTO str = jsonDTOList.get(i);

				if (str.getId().equals(id) && str.getTitle().equals(title)) {
					wordObj = new JSONObject();

					wordObj.put("id", str.getId());
					wordObj.put("title", str.getTitle());

					for (WordVO item : str.getItem()) {
						JSONObject itemObj = new JSONObject();
						itemObj.put("word", item.getWord());
						itemObj.put("meaning", item.getMeaning());
						itemObj.put("learningRate", item.getLearningRate());
						itemArray.add(itemObj);
					}

					wordObj.put("item", itemArray);
					wordArray.add(wordObj);
				}
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return wordArray;
	}
	
	@Override
	public JSONArray getLastWordJsonArray(String id, String title) {
		// log.info("get wordList.....");

		JSONArray wordArray = new JSONArray();
		JSONArray itemArray = new JSONArray();

		JSONObject wordObj;

		try {
			List<WordDTO> jsonDTOList = new ObjectMapper().readValue(new File("C:/temp/test02.json"),
					new TypeReference<List<WordDTO>>() {
					});
			int size = jsonDTOList.size();
			for (int i = 0; i < size; i++) {
				WordDTO str = jsonDTOList.get(i);

				if (str.getId().equals(id) && str.getTitle().equals(title)) {
					wordObj = new JSONObject();

					wordObj.put("id", str.getId());
					wordObj.put("title", str.getTitle());

					for (WordVO item : str.getItem()) {
						JSONObject itemObj = new JSONObject();
						itemObj.put("word", item.getWord());
						itemObj.put("meaning", item.getMeaning());
						itemObj.put("learningRate", item.getLearningRate());
						itemArray.add(itemObj);
					}

					wordObj.put("item", itemArray);
					wordArray.add(wordObj);
				}
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return wordArray;
	}


	@Override
	public WordDTO getWordDTO(String id, String title) {
		log.info("get dto");
		List<WordDTO> worddto = getAllWordList();

		return worddto.stream().filter(w -> w.getId().equals(id) && w.getTitle().equals(title)).findFirst().get();
	}
	
	@Override
	public WordDTO getMyWordDTO(String id, String title) {
		log.info("get My dto");
		List<WordDTO> worddto = getAllMyWordList();

		return worddto.stream().filter(w -> w.getId().equals(id) && w.getTitle().equals(title)).findFirst().get();
	}

	@Override
	public void upRate(String id, String title, String word) {
		WordDTO dto = getMyWordDTO(id, title);
		for (WordVO item : dto.getItem()) {
			if (item.getWord().equals(word)) {
				int rate = item.getLearningRate();
				log.info("upRate : "+rate);
				if(rate == 0) {
					item.setLearningRate(1);
				}
				else {
					rate += 1;
					item.setLearningRate(rate);
				}
				log.info("占쌕뀐옙 占쏙옙 : "+rate);
				//item.setLearningRate(1);
				log.info(dto.getId()+','+dto.getTitle());
				log.info(item.getWord()+','+item.getMeaning()+','+item.getLearningRate());
			}
		}				
		  JSONArray wordArray = new JSONArray(); 
		  JSONArray itemArray = new JSONArray();
		  
		  JSONObject wordObj;
		  
		  
		  try { List<WordDTO> jsonDTOList = new ObjectMapper().readValue(new
		  File("C:/temp/test02.json"), new TypeReference<List<WordDTO>>() {}); 
		  
		  int size = jsonDTOList.size(); 
		  
		  for (int i = 0; i < size; i++) 
		  { 
			  WordDTO str = jsonDTOList.get(i);
			  
			  //占쌕뀐데占쏙옙占싶뤄옙 占쏙옙占쏙옙
			  if(str.getId().equals(dto.getId()) && str.getTitle().equals(dto.getTitle()))
			  { 
				  str.setItem(dto.getItem());		  
			  } 
					
			  wordObj = new JSONObject(); 
			  wordObj.put("id", str.getId());
			  wordObj.put("title", str.getTitle()); 
			  
			  for (WordVO item : str.getItem()) 
			  { 
				  JSONObject itemObj = new JSONObject();
				  itemObj.put("word", item.getWord()); 
				  itemObj.put("meaning", item.getMeaning());
				  itemObj.put("learningRate", item.getLearningRate());
				  itemArray.add(itemObj); 
			  }			
			  
			  wordObj.put("item",str.getItem());
			  wordArray.add(wordObj);
			  
		 }		  
		  log.info(wordArray);	  
		
		  //file占쏙옙 占쏙옙占쏙옙
		  BufferedWriter writer = new BufferedWriter( new OutputStreamWriter(new
		  FileOutputStream("C:\\temp\\test02.json"), "utf-8"));
		  writer.write(wordArray.toString()); 
		  writer.flush(); 
		  writer.close();	  
		  
		  } catch (IOException e1){ 
			  e1.printStackTrace(); 
		  }
		  
	}//end upRate
	
	
	@Override
	public void resetRate(String id, String title) {
				
		  JSONArray wordArray = new JSONArray(); 
		  JSONArray itemArray = new JSONArray();
		  
		  JSONObject wordObj;		  
		  
		  try { List<WordDTO> jsonDTOList = new ObjectMapper().readValue(new
		  File("C:/temp/test02.json"), new TypeReference<List<WordDTO>>() {}); 
		  
		  int size = jsonDTOList.size(); 
		  
		  for (int i = 0; i < size; i++) 
		  { 
			  WordDTO str = jsonDTOList.get(i);
								
			  wordObj = new JSONObject(); 
			  wordObj.put("id", str.getId());
			  wordObj.put("title", str.getTitle()); 
			  
			  if(str.getId().equals(id)&&str.getTitle().equals(title)) {
				  for (WordVO item : str.getItem()) 
				  { 
					  JSONObject itemObj = new JSONObject();
					  itemObj.put("word", item.getWord()); 
					  itemObj.put("meaning", item.getMeaning());
					  itemObj.put("learningRate", 0);
					  itemArray.add(itemObj); 
				  }	
				  wordObj.put("item",itemArray);
			  }
			  else {
				  wordObj.put("item",str.getItem());
			  }		
			  
			  wordArray.add(wordObj);
			  
		 }		  
		  log.info(wordArray);	  
		
		  //file占쏙옙 占쏙옙占쏙옙
		  BufferedWriter writer = new BufferedWriter( new OutputStreamWriter(new
		  FileOutputStream("C:\\temp\\test02.json"), "utf-8"));
		  writer.write(wordArray.toString()); 
		  writer.flush(); 
		  writer.close();	  
		  
		  } catch (IOException e1){ 
			  e1.printStackTrace(); 
		  }
		
	}

	@Override
	public JSONArray getMyList(String id) {
		log.info("get myList.....");
		
		JSONArray wordArray = new JSONArray();
		

		JSONObject wordObj;

		try {
			List<WordDTO> jsonDTOList = new ObjectMapper().readValue(new File("C:/temp/test01.json"),
					new TypeReference<List<WordDTO>>() {
					});
			int size = jsonDTOList.size();
			for (int i = 0; i < size; i++) {
				JSONArray itemArray = new JSONArray();
				WordDTO str = jsonDTOList.get(i);

				if (str.getId().equals(id)) {
					log.info("id : " + str.getId());
					wordObj = new JSONObject();

					wordObj.put("id", str.getId());
					wordObj.put("title", str.getTitle());

					for (WordVO item : str.getItem()) {
						JSONObject itemObj = new JSONObject();
						itemObj.put("word", item.getWord());
						itemObj.put("meaning", item.getMeaning());
						itemObj.put("learningRate", item.getLearningRate());
						itemArray.add(itemObj);
					}

					wordObj.put("item", itemArray);
					wordArray.add(wordObj);
				}
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return wordArray;
	}
	
	@Override
	public JSONArray getIdSearchList(String id) {
		log.info("search Id.....");
		
		JSONArray wordArray = new JSONArray();
		
		JSONObject wordObj;

		try {
			List<WordDTO> jsonDTOList = new ObjectMapper().readValue(new File("C:/temp/test01.json"),
					new TypeReference<List<WordDTO>>() {
					});
			int size = jsonDTOList.size();
			for (int i = 0; i < size; i++) {
				JSONArray itemArray = new JSONArray();
				WordDTO str = jsonDTOList.get(i);

				if (str.getId().contains(id)) {
					log.info("id : " + str.getId());
					wordObj = new JSONObject();

					wordObj.put("id", str.getId());
					wordObj.put("title", str.getTitle());

					for (WordVO item : str.getItem()) {
						JSONObject itemObj = new JSONObject();
						itemObj.put("word", item.getWord());
						itemObj.put("meaning", item.getMeaning());
						itemObj.put("learningRate", item.getLearningRate());
						itemArray.add(itemObj);
					}

					wordObj.put("item", itemArray);
					wordArray.add(wordObj);
				}
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return wordArray;
	}

	@Override
	public JSONArray getTitleSearchList(String title) {
		log.info("search Title.....");
		
		JSONArray wordArray = new JSONArray();
		

		JSONObject wordObj;

		try {
			List<WordDTO> jsonDTOList = new ObjectMapper().readValue(new File("C:/temp/test01.json"),
					new TypeReference<List<WordDTO>>() {
					});
			int size = jsonDTOList.size();
			for (int i = 0; i < size; i++) {
				JSONArray itemArray = new JSONArray();
				WordDTO str = jsonDTOList.get(i);

				if (str.getTitle().contains(title)) {
					log.info("id : " + str.getId());
					wordObj = new JSONObject();

					wordObj.put("id", str.getId());
					wordObj.put("title", str.getTitle());

					for (WordVO item : str.getItem()) {
						JSONObject itemObj = new JSONObject();
						itemObj.put("word", item.getWord());
						itemObj.put("meaning", item.getMeaning());
						itemObj.put("learningRate", item.getLearningRate());
						itemArray.add(itemObj);
					}

					wordObj.put("item", itemArray);
					wordArray.add(wordObj);
				}
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return wordArray;
	}

	@Override
	public void addRecentStudy(StudyDTO study) {
		
		log.info("insert recent study....");
		if(mapper.checkDup(study) == 1) {
			log.info("delete...");
			mapper.delete(study);
		}		
		
		mapper.insert(study);
	}

	@Override
	public void copyWordList(String id, String title) {
		
		WordDTO dto = getWordDTO(id, title);
		
		log.info("dto....");
		log.info(dto);
		
		JSONArray wordArray = new JSONArray(); 
		JSONArray itemArray = new JSONArray();

		JSONObject wordObj;
		
		boolean inList = false;
		
		try {
			
			
			String path = "C:/temp/test02.json";
			File file = new File(path);

			if(!file.exists()) {
				
				wordObj = new JSONObject();
				wordArray = new JSONArray();
				
				wordObj.put("id", dto.getId()); 
				wordObj.put("title", dto.getTitle());
				wordObj.put("item", dto.getItem());
				
				wordArray.add(wordObj);
				inList = true;
			}
			else {
				
				List<WordDTO> jsonDTOList = new ObjectMapper().readValue(new File("C:/temp/test02.json"),
						new TypeReference<List<WordDTO>>() {
						});
				
				
				log.info("jsonDTOList dto  : "+jsonDTOList.contains(dto));
				
				int size = jsonDTOList.size();
				
				
				  for (int i = 0; i < size; i++) 
				  {
					  
					  WordDTO str = jsonDTOList.get(i);
					  itemArray = new JSONArray();
					  
					  if(str.getId().equals(id) && str.getTitle().equals(title)) {
						  
						  inList = true;
					  }
				  
					  wordObj = new JSONObject();
					  
					  wordObj.put("id", str.getId()); 
					  wordObj.put("title", str.getTitle());
					  
						  for (WordVO item : str.getItem()) 
						  { 
							  JSONObject itemObj = new JSONObject();
							  
							  
							  itemObj.put("word", item.getWord()); 
							  itemObj.put("meaning",item.getMeaning()); 
							  itemObj.put("learningRate", item.getLearningRate());
							  itemArray.add(itemObj); 
						  }
						  
					  wordObj.put("item", itemArray); 
					  wordArray.add(wordObj);
					  //log.info(wordArray);
					  //log.info(inList);
				  }	  
				
			}
						
			if(inList) {
				//�떒�뼱�옣�씠 議댁옱�븯硫�
				log.info("aleady exist...");
			}
			else {					
				wordObj = new JSONObject();
				
				wordObj.put("id", dto.getId()); 
				wordObj.put("title", dto.getTitle());
				wordObj.put("item", dto.getItem());
				
				wordArray.add(wordObj);
			}			
				log.info(wordArray);
						
		  //file save
		  BufferedWriter writer = new BufferedWriter( new OutputStreamWriter(new
		  FileOutputStream("C:\\temp\\test02.json"), "utf-8"));
		  writer.write(wordArray.toString()); 
		  writer.flush(); 
		  writer.close();
			
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
	}

	@Override
	public JSONArray getMyRecentList(String id) {
			
		log.info("get Recent List.....");
		
		JSONArray wordArray = new JSONArray();		

		JSONObject wordObj;
		
		List<StudyDTO> studyDTOList = mapper.getRecentList(id);
		
		int size = studyDTOList.size();
		
		for (int i = 0; i < size; i++) 
		{
			StudyDTO str = studyDTOList.get(i);

			wordObj = new JSONObject();

			wordObj.put("userId", str.getUserId());
			wordObj.put("bookId", str.getBookId());
			wordObj.put("bookTitle", str.getBookTitle());
			wordObj.put("studyDate", str.getStudyDate());
			
			wordArray.add(wordObj);
					
		}
		return wordArray;
	}

		

}
