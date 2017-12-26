package edu.gdut.imis.byf3114004859.modules.race.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.modules.race.dao.RoundDao;
import edu.gdut.imis.byf3114004859.modules.race.entity.RoundEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.RoundService;



@Service("roundService")
public class RoundServiceImpl implements RoundService {
	@Autowired
	private RoundDao roundDao;
	
	@Override
	public RoundEntity queryObject(Long roundId){
		return roundDao.queryObject(roundId);
	}
	
	@Override
	public List<RoundEntity> queryList(Map<String, Object> map){
		return roundDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return roundDao.queryTotal(map);
	}
	
	@Override
	public void save(RoundEntity round){
		if(round.getOrder() == null){
			Map<String, Object> params = new HashMap<>();
			params.put("competitionId", round.getCompetitionId());
			List<RoundEntity> roundEntityList = roundDao.queryList(params);
			int max = 1;
			for(RoundEntity roundEntity : roundEntityList){
				if(roundEntity.getOrder() > 1){
					max = roundEntity.getOrder();
				}
			}
			round.setOrder(max+1);
		}
		roundDao.save(round);
	}
	
	@Override
	public void update(RoundEntity round){
		roundDao.update(round);
	}
	
	@Override
	public void delete(Long roundId){
		roundDao.delete(roundId);
	}
	
	@Override
	public void deleteBatch(Long[] roundIds){
		roundDao.deleteBatch(roundIds);
	}

	@Override
	public List<RoundEntity> queryByCompetition(Long id) {
		Map<String, Object> param = new HashMap<>();
		param.put("competitionId", id);
		return roundDao.queryList(param);
	}

}
