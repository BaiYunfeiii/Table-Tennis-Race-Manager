package edu.gdut.imis.byf3114004859.modules.race.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.modules.race.dao.StageDao;
import edu.gdut.imis.byf3114004859.modules.race.entity.StageEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.StageService;



@Service("stageService")
public class StageServiceImpl implements StageService {
	@Autowired
	private StageDao stageDao;
	
	@Override
	public StageEntity queryObject(Long id){
		return stageDao.queryObject(id);
	}
	
	@Override
	public List<StageEntity> queryList(Map<String, Object> map){
		return stageDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return stageDao.queryTotal(map);
	}
	
	@Override
	public void save(StageEntity stage){
		stageDao.save(stage);
	}
	
	@Override
	public void update(StageEntity stage){
		stageDao.update(stage);
	}
	
	@Override
	public void delete(Long id){
		stageDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		stageDao.deleteBatch(ids);
	}
	
}
