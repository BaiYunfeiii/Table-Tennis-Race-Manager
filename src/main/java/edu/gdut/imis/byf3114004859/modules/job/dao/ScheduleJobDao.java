package edu.gdut.imis.byf3114004859.modules.job.dao;

import edu.gdut.imis.byf3114004859.modules.sys.dao.BaseDao;
import edu.gdut.imis.byf3114004859.modules.job.entity.ScheduleJobEntity;

import java.util.Map;

/**
 * 定时任务
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年12月1日 下午10:29:57
 */
public interface ScheduleJobDao extends BaseDao<ScheduleJobEntity> {
	
	/**
	 * 批量更新状态
	 */
	int updateBatch(Map<String, Object> map);
}
