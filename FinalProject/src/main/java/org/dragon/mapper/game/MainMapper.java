package org.dragon.mapper.game;

import java.util.Date;

import org.dragon.domain.game.UserVO;


public interface MainMapper {

	public void create(UserVO userVO);
	public Date getDate(String userId);
	public void updateDate(String userId);
}
