package edu.gdut.imis.byf3114004859.modules.sys.service;

import edu.gdut.imis.byf3114004859.common.utils.R;
import edu.gdut.imis.byf3114004859.modules.race.entity.CompetitionEntity;

import java.util.List;

/**
 * Created by Yunfei on 2017/12/26.
 */
public interface ArrangeSerivce {

    R arrangeCompetition(Long stageId, List<CompetitionEntity> competitionEntities);

    R arrangeGround(List<CompetitionEntity> competitionList);

    R arrangeJudge(List<CompetitionEntity> competitionList);

    R arrange(Long id);
}
