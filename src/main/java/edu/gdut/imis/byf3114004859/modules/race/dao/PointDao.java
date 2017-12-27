package edu.gdut.imis.byf3114004859.modules.race.dao;

import edu.gdut.imis.byf3114004859.modules.race.entity.PointEntity;
import edu.gdut.imis.byf3114004859.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Param;

/**
 * 
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-12 11:03:42
 */
public interface PointDao extends BaseDao<PointEntity> {

    PointEntity queryObjectByUserIdAndStageId(@Param("userId") Long userId,@Param("stageId") Long stageId);
}
