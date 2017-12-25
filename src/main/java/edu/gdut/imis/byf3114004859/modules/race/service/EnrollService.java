package edu.gdut.imis.byf3114004859.modules.race.service;

import edu.gdut.imis.byf3114004859.modules.race.entity.EnrollEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-25 15:52:50
 */
public interface EnrollService {
	
	EnrollEntity queryObject(Long enrollId);
	
	List<EnrollEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(EnrollEntity enroll);
	
	void update(EnrollEntity enroll);
	
	void delete(Long enrollId);
	
	void deleteBatch(Long[] enrollIds);
}
