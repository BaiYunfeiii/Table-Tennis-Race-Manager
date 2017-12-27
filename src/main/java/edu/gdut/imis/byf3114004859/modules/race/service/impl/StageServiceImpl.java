package edu.gdut.imis.byf3114004859.modules.race.service.impl;

import edu.gdut.imis.byf3114004859.common.utils.Param;
import edu.gdut.imis.byf3114004859.common.utils.R;
import edu.gdut.imis.byf3114004859.modules.race.entity.CompetitionEntity;
import edu.gdut.imis.byf3114004859.modules.race.entity.PointEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.CompetitionService;
import edu.gdut.imis.byf3114004859.modules.race.service.PointService;
import edu.gdut.imis.byf3114004859.modules.race.service.StatisticService;
import edu.gdut.imis.byf3114004859.modules.sys.controller.SysUserController;
import edu.gdut.imis.byf3114004859.modules.sys.entity.SysUserEntity;
import edu.gdut.imis.byf3114004859.modules.sys.service.SysUserService;
import javafx.stage.Stage;
import org.omg.CORBA.UserException;
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
	@Autowired
	private CompetitionService competitionService;
	@Autowired
	private StatisticService statisticService;
	@Autowired
	private SysUserService userService;
	@Autowired
	private PointService pointService;

	@Override
	public void arrange(Long stageId) {
		//TODO 安排本场次的活动
	}

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

	@Override
	public StageEntity getNextStage(StageEntity stage){
		List<StageEntity> stageList = stageDao.queryList(Param.build("order",stage.getOrder()+1).put("raceId", stage.getRaceId()));
		if(stageList.isEmpty()){
			return null;
		}
		return stageList.get(0);
	}

	@Override
	public R finish(StageEntity stage) {
		stage = stageDao.queryObject(stage.getId());
		List<CompetitionEntity> competitionList = competitionService.queryList(Param.build("stageId", stage.getId()));
		statisticService.statisticPoint(competitionList);
		statisticService.statisticWinner(stage);
		return R.ok();
	}

}
