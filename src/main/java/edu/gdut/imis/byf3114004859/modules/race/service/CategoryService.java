package edu.gdut.imis.byf3114004859.modules.race.service;

import edu.gdut.imis.byf3114004859.modules.race.entity.CategoryEntity;

import java.util.List;
import java.util.Map;

/**
 * 比赛分类
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-11-10 14:15:32
 */
public interface CategoryService {
	
	CategoryEntity queryObject(Long id);
	
	List<CategoryEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(CategoryEntity category);
	
	void update(CategoryEntity category);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
