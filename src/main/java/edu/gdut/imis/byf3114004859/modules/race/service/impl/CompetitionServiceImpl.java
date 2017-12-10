package edu.gdut.imis.byf3114004859.modules.race.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.modules.race.dao.CompetitionDao;
import edu.gdut.imis.byf3114004859.modules.race.entity.CompetitionEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.CompetitionService;



@Service("competitionService")
public class CompetitionServiceImpl implements CompetitionService {
	@Autowired
	private CompetitionDao competitionDao;
	
	@Override
	public CompetitionEntity queryObject(Long id){
		return competitionDao.queryObject(id);
	}
	
	@Override
	public List<CompetitionEntity> queryList(Map<String, Object> map){
		return competitionDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return competitionDao.queryTotal(map);
	}
	
	@Override
	public void save(CompetitionEntity competition){
		competitionDao.save(competition);
	}
	
	@Override
	public void update(CompetitionEntity competition){
		competitionDao.update(competition);
	}
	
	@Override
	public void delete(Long id){
		competitionDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		competitionDao.deleteBatch(ids);
	}
	
}
