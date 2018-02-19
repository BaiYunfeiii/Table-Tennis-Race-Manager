package edu.gdut.imis.byf3114004859.modules.sys.service.arrange;

import edu.gdut.imis.byf3114004859.common.utils.R;
import edu.gdut.imis.byf3114004859.modules.race.entity.CompetitionEntity;
import edu.gdut.imis.byf3114004859.modules.sys.service.ArrangeSerivce;
import edu.gdut.imis.byf3114004859.modules.sys.service.impl.ArrangeServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Yunfei on 2017/12/26.
 */
@Service("roundArrangeService")
public class RoundArrangeServiceImple extends ArrangeServiceImpl {

    @Override
    public R arrangeCompetition(Long stageId, List<CompetitionEntity> competitionEntities) {
        return R.error("待开发循环赛功能");
    }

    @Override
    public R arrangeGround(List<CompetitionEntity> competitionList) {
        return R.error();
    }

    @Override
    public R arrangeJudge(List<CompetitionEntity> competitionList) {
        return R.error();
    }

}
