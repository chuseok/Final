package org.dragon.mapper.game;

import java.util.List;

import org.dragon.domain.game.RankVO;

public interface RankMapper {

	public List<RankVO> getRankList();
	public RankVO getUserRank(String userId);
	public String getProfile(String userId);
}
