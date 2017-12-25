package edu.gdut.imis.byf3114004859.modules.race.service.impl;

import edu.gdut.imis.byf3114004859.modules.race.dto.CompetitionDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
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
	public List<CompetitionDto> buildDto(List<CompetitionEntity> competitionEntities) {
		List<CompetitionDto> dtoList = new ArrayList<>(competitionEntities.size());
		for (CompetitionEntity c: competitionEntities) {

		}
		return null;
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

	@Override
	public List<CompetitionEntity> queryByStage(Long id) {
		HashMap<String, Object> param = new HashMap<>();
		param.put("raceId", id);
		return competitionDao.queryList(param);
	}

}
