package edu.gdut.imis.byf3114004859.modules.race.entity;

import edu.gdut.imis.byf3114004859.modules.sys.entity.SysUserEntity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-25 15:52:50
 */
public class EnrollEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long enrollId;
	//
	private Long userId;
	//
	private Long raceId;
	//
	private Date enrollTime;

	private RaceEntity race;

	private SysUserEntity user;

	/**
	 * 设置：
	 */
	public void setEnrollId(Long enrollId) {
		this.enrollId = enrollId;
	}
	/**
	 * 获取：
	 */
	public Long getEnrollId() {
		return enrollId;
	}
	/**
	 * 设置：
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	/**
	 * 获取：
	 */
	public Long getUserId() {
		return userId;
	}
	/**
	 * 设置：
	 */
	public void setRaceId(Long raceId) {
		this.raceId = raceId;
	}
	/**
	 * 获取：
	 */
	public Long getRaceId() {
		return raceId;
	}
	/**
	 * 设置：
	 */
	public void setEnrollTime(Date enrollTime) {
		this.enrollTime = enrollTime;
	}
	/**
	 * 获取：
	 */
	public Date getEnrollTime() {
		return enrollTime;
	}

	public RaceEntity getRace() {
		return race;
	}

	public void setRace(RaceEntity race) {
		this.race = race;
	}

	public SysUserEntity getUser() {
		return user;
	}

	public void setUser(SysUserEntity user) {
		this.user = user;
	}
}
