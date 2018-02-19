package edu.gdut.imis.byf3114004859.modules.race.service.impl;

import edu.gdut.imis.byf3114004859.common.utils.Param;
import edu.gdut.imis.byf3114004859.common.utils.R;
import edu.gdut.imis.byf3114004859.modules.race.entity.CompetitionEntity;
import edu.gdut.imis.byf3114004859.modules.race.entity.PointEntity;
import edu.gdut.imis.byf3114004859.modules.race.entity.StageEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.CompetitionService;
import edu.gdut.imis.byf3114004859.modules.race.service.PointService;
import edu.gdut.imis.byf3114004859.modules.race.service.StageService;
import edu.gdut.imis.byf3114004859.modules.race.service.StatisticService;
import edu.gdut.imis.byf3114004859.modules.sys.entity.SysUserEntity;
import edu.gdut.imis.byf3114004859.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Yunfei on 2017/12/26.
 */
@Service
public class StatisticServiceImpl implements StatisticService {

    @Autowired
    CompetitionService competitionService;
    @Autowired
    SysUserService userService;
    @Autowired
    StageService stageService;
    @Autowired
    PointService pointService;

    @Override
    public List<SysUserEntity> statisticWinner(StageEntity stage) {
        List<CompetitionEntity> competitionList = competitionService.queryList(Param.build("stageId", stage.getId()));
        List<SysUserEntity> winnerList = new ArrayList<>();
        StageEntity nextStage = stageService.getNextStage(stage);
        if(nextStage != null) {
            for (CompetitionEntity c :
                    competitionList) {
                //晋级结果
                SysUserEntity user = userService.queryObject(c.getWinnerId());
                PointEntity p = new PointEntity();
                p.setStageId(nextStage.getId());
                p.setUserId(user.getUserId());

                pointService.save(p);

                winnerList.add(user);
            }

        }
        for (SysUserEntity u: winnerList) {
            PointEntity point = pointService.queryObject(Param.build("raceId",stage.getRaceId()).put("userId", u.getUserId()));
            point.setOrder(winnerList.size());
            pointService.update(point);
        }

        return winnerList;
    }

    @Override
    public R statisticPoint(List<CompetitionEntity> competitionEntities){
        for (CompetitionEntity c : competitionEntities ) {
            SysUserEntity host = userService.queryObject(c.getHostId());
            SysUserEntity guest = userService.queryObject(c.getGuestId());
            StageEntity stage = stageService.queryObject(c.getStageId());

            PointEntity p = pointService.queryObjectByUserIdAndStageId(c.getHostId(),c.getStageId());
            p.setPoint(c.getGuestPoint());
            p.setBye(0);
            pointService.update(p);

            PointEntity guestPoint = pointService.queryObjectByUserIdAndStageId(c.getGuestId(),c.getStageId());
            guestPoint.setPoint(c.getGuestPoint());
            guestPoint.setBye(0);
            pointService.update(guestPoint);
        }
        return R.ok();
    }
}
