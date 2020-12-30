package org.dragon.domain.study;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WordDTO {

	private String id;
	private String title;
	private List<WordVO> item;

}
