package edu.gdut.imis.byf3114004859.modules.race.service;

import edu.gdut.imis.byf3114004859.common.utils.R;
import edu.gdut.imis.byf3114004859.modules.race.entity.CompetitionEntity;
import edu.gdut.imis.byf3114004859.modules.race.entity.StageEntity;
import edu.gdut.imis.byf3114004859.modules.sys.entity.SysUserEntity;

import java.util.List;

/**
 * Created by Yunfei on 2017/12/26.
 */
public interface StatisticService {

    List<SysUserEntity> statisticWinner(StageEntity stage);

    R statisticPoint(List<CompetitionEntity> competitionEntities);
}
