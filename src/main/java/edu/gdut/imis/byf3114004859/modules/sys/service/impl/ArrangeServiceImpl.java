package edu.gdut.imis.byf3114004859.modules.sys.service.impl;

import edu.gdut.imis.byf3114004859.common.utils.R;
import edu.gdut.imis.byf3114004859.modules.race.entity.CompetitionEntity;
import edu.gdut.imis.byf3114004859.modules.race.entity.GroundEntity;
import edu.gdut.imis.byf3114004859.modules.race.entity.PointEntity;
import edu.gdut.imis.byf3114004859.modules.race.entity.StageEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.CompetitionService;
import edu.gdut.imis.byf3114004859.modules.race.service.GroundService;
import edu.gdut.imis.byf3114004859.modules.race.service.PointService;
import edu.gdut.imis.byf3114004859.modules.race.service.StageService;
import edu.gdut.imis.byf3114004859.modules.sys.entity.SysUserEntity;
import edu.gdut.imis.byf3114004859.modules.sys.service.ArrangeSerivce;
import edu.gdut.imis.byf3114004859.modules.sys.service.SysUserService;
import org.omg.CORBA.UserException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

/**
 * Created by Yunfei on 2017/12/26.
 */
@Service
public class ArrangeServiceImpl implements ArrangeSerivce {

    @Autowired
    private StageService stageService;
    @Autowired
    private PointService pointService;
    @Autowired
    private SysUserService userService;
    @Autowired
    private CompetitionService competitionService;
    @Autowired
    private GroundService groundService;

    public R arrange(Long stageId){
        List<CompetitionEntity> competitionList = new LinkedList<>();
        R r = arrangeCompetition(stageId, competitionList);
        if((int)r.get("code") != 0){
            return r;
        }
        arrangeGround(competitionList);
        if((int)r.get("code") != 0){
            return r;
        }
        arrangeJudge(competitionList);
        if((int)r.get("code") != 0){
            return r;
        }
        for (CompetitionEntity c :
                competitionList) {
            competitionService.save(c);
        }
        return R.ok();
    }

    @Override
    public R arrangeCompetition(Long stageId, List<CompetitionEntity> competitionEntities) {
        StageEntity stage = stageService.queryObject(stageId);

        Map<String, Object> params = new HashMap<>();
        params.put("stageId", stageId);

        //查询本轮的选手
        List<PointEntity> points = pointService.queryList(params);
        List<SysUserEntity> userList = new ArrayList<>(points.size());

        for (PointEntity point : points) {
            userList.add(userService.queryObject(point.getUserId()));
        }

        double term = Math.log(userList.size());
        if(new BigDecimal(term).equals(new BigDecimal((int)term))){ //如果不是2的整数次幂
            return R.error("当前人数无法自动进行淘汰赛编排:"+userList.size()+"人");
        }

        int competitionCount = userList.size()/2;
        for (int i = 0; i < competitionCount; i++) {
            CompetitionEntity c = new CompetitionEntity();
            c.setName("第"+(i+1)+"场");
            c.setHostId(randomGet(userList).getUserId());
            c.setGuestId(randomGet(userList).getUserId());
            c.setStatus(1);
            c.setOrder(i+1);
            c.setStageId(stageId);

            competitionEntities.add(c);
        }

        return R.ok();

    }

    @Override
    public R arrangeGround(List<CompetitionEntity> competitionList) {
        Map<String, Object> param = new HashMap<>();
        param.put("category", 1);
        List<GroundEntity> groundEntities = groundService.queryList(param);

        for (int i = 0; i < competitionList.size(); i++) {
            GroundEntity ground = groundEntities.get(i%groundEntities.size());
            competitionList.get(i).setGroundId(ground.getId());
        }

        return R.ok();
    }

    @Override
    public R arrangeJudge(List<CompetitionEntity> competitionList) {
        //TODO 安排裁判
        return R.ok();
    }

    private SysUserEntity randomGet(List<SysUserEntity> list){
        int index = (int)(Math.random()*list.size());
        return list.remove(index);
    }
}
