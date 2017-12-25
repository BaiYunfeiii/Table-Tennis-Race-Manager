package edu.gdut.imis.byf3114004859.modules.race.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.modules.race.dao.EnrollDao;
import edu.gdut.imis.byf3114004859.modules.race.entity.EnrollEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.EnrollService;



@Service("enrollService")
public class EnrollServiceImpl implements EnrollService {
	@Autowired
	private EnrollDao enrollDao;
	
	@Override
	public EnrollEntity queryObject(Long enrollId){
		return enrollDao.queryObject(enrollId);
	}
	
	@Override
	public List<EnrollEntity> queryList(Map<String, Object> map){
		return enrollDao.queryList(map);
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
