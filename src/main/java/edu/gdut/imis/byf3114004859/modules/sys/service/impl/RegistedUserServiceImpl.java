package edu.gdut.imis.byf3114004859.modules.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.modules.sys.dao.RegistedUserDao;
import edu.gdut.imis.byf3114004859.modules.sys.entity.RegistedUserEntity;
import edu.gdut.imis.byf3114004859.modules.sys.service.RegistedUserService;



@Service("registedUserService")
public class RegistedUserServiceImpl implements RegistedUserService {
	@Autowired
	private RegistedUserDao registedUserDao;
	
	@Override
	public RegistedUserEntity queryObject(Long id){
		return registedUserDao.queryObject(id);
	}
	
	@Override
	public List<RegistedUserEntity> queryList(Map<String, Object> map){
		return registedUserDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return registedUserDao.queryTotal(map);
	}
	
	@Override
	public void save(RegistedUserEntity registedUser){
		registedUserDao.save(registedUser);
	}
	
	@Override
	public void update(RegistedUserEntity registedUser){
		registedUserDao.update(registedUser);
	}
	
	@Override
	public void delete(Long id){
		registedUserDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		registedUserDao.deleteBatch(ids);
	}
	
}
