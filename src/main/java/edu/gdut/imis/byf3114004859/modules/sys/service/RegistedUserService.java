package edu.gdut.imis.byf3114004859.modules.sys.service;

import edu.gdut.imis.byf3114004859.modules.sys.entity.RegistedUserEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-11-08 22:54:44
 */
public interface RegistedUserService {
	
	RegistedUserEntity queryObject(Long id);
	
	List<RegistedUserEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(RegistedUserEntity registedUser);
	
	void update(RegistedUserEntity registedUser);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
