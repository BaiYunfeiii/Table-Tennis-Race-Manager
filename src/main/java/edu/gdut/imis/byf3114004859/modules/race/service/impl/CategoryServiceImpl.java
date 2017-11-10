package edu.gdut.imis.byf3114004859.modules.race.service.impl;

import edu.gdut.imis.byf3114004859.modules.race.entity.CategoryEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.CategoryService;
import edu.gdut.imis.byf3114004859.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.modules.race.dao.CategoryDao;


@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private SysUserService userService;
	
	@Override
	public CategoryEntity queryObject(Long id){
		return categoryDao.queryObject(id);
	}
	
	@Override
	public List<CategoryEntity> queryList(Map<String, Object> map){
		return categoryDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return categoryDao.queryTotal(map);
	}
	
	@Override
	public void save(CategoryEntity category){
		category.setCreateUser(userService.getCurrentUser());
		category.setCreateTime(new Date());
		categoryDao.save(category);
	}
	
	@Override
	public void update(CategoryEntity category){
		categoryDao.update(category);
	}
	
	@Override
	public void delete(Long id){
		categoryDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		categoryDao.deleteBatch(ids);
	}
	
}
