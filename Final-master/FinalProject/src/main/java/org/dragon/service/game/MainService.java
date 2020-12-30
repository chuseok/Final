package org.dragon.service.game;

import java.util.Date;

import org.dragon.domain.game.UserVO;

public interface MainService {
	public void createUsers(UserVO userVO);
	public Date getDate(String userId);
	public void updateDate(String userId);
}
