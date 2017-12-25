package edu.gdut.imis.byf3114004859.modules.race.service;

import edu.gdut.imis.byf3114004859.modules.race.entity.RoundEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-12 23:29:59
 */
public interface RoundService {
	
	RoundEntity queryObject(Long roundId);
	
	List<RoundEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(RoundEntity round);
	
	void update(RoundEntity round);
	
	void delete(Long roundId);
	
	void deleteBatch(Long[] roundIds);

    List<RoundEntity> queryByCompetition(Long id);
}
