package edu.gdut.imis.byf3114004859.modules.race.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.modules.race.dao.RaceDao;
import edu.gdut.imis.byf3114004859.modules.race.entity.RaceEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.RaceService;



@Service("raceService")
public class RaceServiceImpl implements RaceService {
	@Autowired
	private RaceDao raceDao;
	
	@Override
	public RaceEntity queryObject(Long id){
		return raceDao.queryObject(id);
	}
	
	@Override
	public List<RaceEntity> queryList(Map<String, Object> map){
		return raceDao.queryList(map);
	}

	@Override
	public List<RaceEntity> queryListByStatus(int status) {
		HashMap<String, Integer> param = new HashMap<>();
		param.put("status", status);
		return raceDao.queryList(param);
	}

	@Override
	public int queryTotal(Map<String, Object> map){
		return raceDao.queryTotal(map);
	}
	
	@Override
	public void save(RaceEntity race){
		raceDao.save(race);
	}
	
	@Override
	public void update(RaceEntity race){
		raceDao.update(race);
	}
	
	@Override
	public void delete(Long id){
		raceDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		raceDao.deleteBatch(ids);
	}
	
}
