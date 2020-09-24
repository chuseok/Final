package org.dragon.domain.study;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WordVO {
	
	private String word;
	private String meaning;
	private int learningRate;
}
