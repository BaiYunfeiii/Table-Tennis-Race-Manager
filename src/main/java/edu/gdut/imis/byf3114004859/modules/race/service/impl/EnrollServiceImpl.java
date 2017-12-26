package edu.gdut.imis.byf3114004859.modules.race.service.impl;

import edu.gdut.imis.byf3114004859.common.utils.R;
import edu.gdut.imis.byf3114004859.modules.race.entity.RaceEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.RaceService;
import edu.gdut.imis.byf3114004859.modules.sys.entity.SysUserEntity;
import edu.gdut.imis.byf3114004859.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.modules.race.dao.EnrollDao;
import edu.gdut.imis.byf3114004859.modules.race.entity.EnrollEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.EnrollService;



@Service("enrollService")
public class EnrollServiceImpl implements EnrollService {
	@Autowired
	private EnrollDao enrollDao;
	@Autowired
	private RaceService raceService;
	@Autowired
	private SysUserService userService;
	
	@Override
	public EnrollEntity queryObject(Long enrollId){
		return enrollDao.queryObject(enrollId);
	}
	
	@Override
	public List<EnrollEntity> queryList(Map<String, Object> map){
		return enrollDao.queryList(map);
	}

	@Override
	public R userEnroll(Long raceId, Long userId) {
		if(hasEnrolled(userId, raceId)){
			return R.error("您已报名, 请到\"我的报名的比赛查看\"");
		}
		RaceEntity raceEntity = raceService.queryObject(raceId);
		SysUserEntity userEntity = userService.queryObject(userId);
		if(raceEntity.getEnrollDeadline().before(new Date())){
			return R.error("报名已截至");
		}
		if(raceEntity.getGender() >= 0 && !raceEntity.getGender().equals(userEntity.getGender())){
			return R.error("仅限" + (raceEntity.getGender()==0 ? "男":"女")+"生报名");
		}
		EnrollEntity enrollEntity = new EnrollEntity();
		enrollEntity.setEnrollTime(new Date());
		enrollEntity.setUserId(userId);
		enrollEntity.setRaceId(raceId);
		enrollDao.save(enrollEntity);
		return R.ok();
	}

	public boolean hasEnrolled(Long userId, Long raceId){
		Map<String, Object> params = new HashMap<>();
		params.put("raceId", raceId);
		params.put("userId", userId);
		if(enrollDao.queryTotal(params) > 0){
			return true;
		}
		return false;
	}

	@Override
	public int queryTotal(Map<String, Object> map){
		return enrollDao.queryTotal(map);
	}
	
	@Override
	public void save(EnrollEntity enroll){
		enrollDao.save(enroll);
	}
	
	@Override
	public void update(EnrollEntity enroll){
		enrollDao.update(enroll);
	}
	
	@Override
	public void delete(Long enrollId){
		enrollDao.delete(enrollId);
	}
	
	@Override
	public void deleteBatch(Long[] enrollIds){
		enrollDao.deleteBatch(enrollIds);
	}
	
}
