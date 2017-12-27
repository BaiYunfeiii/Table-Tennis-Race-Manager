package edu.gdut.imis.byf3114004859.modules.race.service;

import edu.gdut.imis.byf3114004859.modules.race.entity.PointEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-12 11:03:42
 */
public interface PointService {
	
	PointEntity queryObject(Long id);

	PointEntity queryObject(Map<String, Object> param);
	
	List<PointEntity> queryList(Map<String, Object> map);

	List<PointEntity> queryCompetitionPoints(Long competitionId);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PointEntity point);
	
	void update(PointEntity point);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	List<PointEntity> queryRoundPoints(Long id);

	PointEntity queryObjectByUserIdAndStageId(Long hostId, Long stageId);
}
