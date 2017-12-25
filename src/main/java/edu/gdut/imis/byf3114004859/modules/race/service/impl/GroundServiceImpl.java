package edu.gdut.imis.byf3114004859.modules.race.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.modules.race.dao.GroundDao;
import edu.gdut.imis.byf3114004859.modules.race.entity.GroundEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.GroundService;



@Service("groundService")
public class GroundServiceImpl implements GroundService {
	@Autowired
	private GroundDao groundDao;
	
	@Override
	public GroundEntity queryObject(Long id){
		return groundDao.queryObject(id);
	}
	
	@Override
	public List<GroundEntity> queryList(Map<String, Object> map){
		return groundDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return groundDao.queryTotal(map);
	}
	
	@Override
	public void save(GroundEntity ground){
		groundDao.save(ground);
	}
	
	@Override
	public void update(GroundEntity ground){
		groundDao.update(ground);
	}
	
	@Override
	public void delete(Long id){
		groundDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		groundDao.deleteBatch(ids);
	}
	
}
