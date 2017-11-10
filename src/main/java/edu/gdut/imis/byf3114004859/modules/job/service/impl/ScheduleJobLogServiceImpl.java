package edu.gdut.imis.byf3114004859.modules.job.service.impl;

import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.modules.job.dao.ScheduleJobLogDao;
import edu.gdut.imis.byf3114004859.modules.job.entity.ScheduleJobLogEntity;
import edu.gdut.imis.byf3114004859.modules.job.service.ScheduleJobLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("scheduleJobLogService")
public class ScheduleJobLogServiceImpl implements ScheduleJobLogService {
	@Autowired
	private ScheduleJobLogDao scheduleJobLogDao;
	
	@Override
	public ScheduleJobLogEntity queryObject(Long jobId) {
		return scheduleJobLogDao.queryObject(jobId);
	}

	@Override
	public List<ScheduleJobLogEntity> queryList(Map<String, Object> map) {
		return scheduleJobLogDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return scheduleJobLogDao.queryTotal(map);
	}

	@Override
	public void save(ScheduleJobLogEntity log) {
		scheduleJobLogDao.save(log);
	}

}
