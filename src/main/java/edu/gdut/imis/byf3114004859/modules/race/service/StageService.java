package edu.gdut.imis.byf3114004859.modules.race.service;

import edu.gdut.imis.byf3114004859.common.utils.R;
import edu.gdut.imis.byf3114004859.modules.race.entity.StageEntity;

import java.util.List;
import java.util.Map;

/**
 * 比赛轮次
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-11-11 21:13:22
 */
public interface StageService {

	/**
	 * 安排本轮次的比赛活动
	 * @param stageId
	 */
	void arrange(Long stageId);
	
	StageEntity queryObject(Long id);
	
	List<StageEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(StageEntity stage);
	
	void update(StageEntity stage);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	StageEntity getNextStage(StageEntity stage);

	R finish(StageEntity stage);
}
