package edu.gdut.imis.byf3114004859.modules.race.service;

import edu.gdut.imis.byf3114004859.modules.race.entity.GroundEntity;

import java.util.List;
import java.util.Map;

/**
 * 场地
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-12 11:03:41
 */
public interface GroundService {
	
	GroundEntity queryObject(Long id);
	
	List<GroundEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(GroundEntity ground);
	
	void update(GroundEntity ground);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
