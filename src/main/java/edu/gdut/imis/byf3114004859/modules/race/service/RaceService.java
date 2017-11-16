package edu.gdut.imis.byf3114004859.modules.race.service;

import edu.gdut.imis.byf3114004859.modules.race.entity.RaceEntity;

import java.util.List;
import java.util.Map;

/**
 * 比赛
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-11-10 13:18:00
 */
public interface RaceService {
	
	RaceEntity queryObject(Long id);
	
	List<RaceEntity> queryList(Map<String, Object> map);

	List<RaceEntity> queryListByStatus(int status);
	
	int queryTotal(Map<String, Object> map);
	
	void save(RaceEntity race);
	
	void update(RaceEntity race);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
