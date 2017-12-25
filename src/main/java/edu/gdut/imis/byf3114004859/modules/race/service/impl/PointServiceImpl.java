package edu.gdut.imis.byf3114004859.modules.race.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.modules.race.dao.PointDao;
import edu.gdut.imis.byf3114004859.modules.race.entity.PointEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.PointService;



@Service("pointService")
public class PointServiceImpl implements PointService {
	@Autowired
	private PointDao pointDao;
	
	@Override
	public PointEntity queryObject(Long id){
		return pointDao.queryObject(id);
	}
	
	@Override
	public List<PointEntity> queryList(Map<String, Object> map){
		return pointDao.queryList(map);
	}

	@Override
	public List<PointEntity> queryCompetitionPoints(Long competitionId) {
		Map<String, Object> param = new HashMap<>();
		param.put("competitionId", competitionId);
		param.put("type", 4);
		return pointDao.queryList(param);
	}

	@Override
	public int queryTotal(Map<String, Object> map){
		return pointDao.queryTotal(map);
	}
	
	@Override
	public void save(PointEntity point){
		pointDao.save(point);
	}
	
	@Override
	public void update(PointEntity point){
		pointDao.update(point);
	}
	
	@Override
	public void delete(Long id){
		pointDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		pointDao.deleteBatch(ids);
	}

	@Override
	public List<PointEntity> queryRoundPoints(Long competitionId) {
		Map<String, Object> param = new HashMap<>();
		param.put("competitionId", competitionId);
		param.put("type", 4);
		return pointDao.queryList(param);
	}

}
