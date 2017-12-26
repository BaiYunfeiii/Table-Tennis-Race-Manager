package edu.gdut.imis.byf3114004859.modules.race.service;

import edu.gdut.imis.byf3114004859.common.utils.R;
import edu.gdut.imis.byf3114004859.modules.race.dto.CompetitionDto;
import edu.gdut.imis.byf3114004859.modules.race.entity.CompetitionEntity;

import java.util.List;
import java.util.Map;

/**
 * 比赛场次
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-10 21:52:41
 */
public interface CompetitionService {
	
	CompetitionEntity queryObject(Long id);
	
	List<CompetitionEntity> queryList(Map<String, Object> map);

	List<CompetitionDto> buildDto(List<CompetitionEntity> competitionEntities);
	
	int queryTotal(Map<String, Object> map);
	
	void save(CompetitionEntity competition);
	
	void update(CompetitionEntity competition);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

    List<CompetitionEntity> queryByStage(Long id);


    R finish(CompetitionEntity competition);
}
