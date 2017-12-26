package edu.gdut.imis.byf3114004859.modules.race.service.impl;

import edu.gdut.imis.byf3114004859.common.utils.Param;
import edu.gdut.imis.byf3114004859.common.utils.R;
import edu.gdut.imis.byf3114004859.modules.race.dto.CompetitionDto;
import edu.gdut.imis.byf3114004859.modules.race.entity.RoundEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.RoundService;
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
	@Autowired
	private RoundService roundService;
	
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
		param.put("stageId", id);
		return competitionDao.queryList(param);
	}

	@Override
	public R finish(CompetitionEntity competition) {
		competition.setStatus(3);
		//统计本局结果
		List<RoundEntity> roundEntityList = roundService.queryList(Param.build("competitionId", competition.getId()));

		int hostPoint = 0;
		int guestPoint = 0;
		for (RoundEntity r :
				roundEntityList) {
			if(r.getHostPoint() > r.getGuestPoint()){
				hostPoint++;
			}else{
				guestPoint++;
			}
		}

		int winCount = competition.getGamesTotal()/2 +1;
		if(hostPoint < winCount && guestPoint < winCount ){
			return R.error("比赛尚未分出胜负");
		}
		competition.setHostPoint(hostPoint);
		competition.setGuestPoint(guestPoint);
		competition.setWinnerId(hostPoint>guestPoint?competition.getHostId():competition.getGuestId());
		competitionDao.update(competition);
		return R.ok();
	}

}
