package org.dragon.service.game;

import java.util.List;

import org.dragon.domain.game.DragonVO;
import org.dragon.domain.game.RankVO;

public interface RankService {

	public List<RankVO> getRankList();
	public RankVO getUserRank(String userId);
}
