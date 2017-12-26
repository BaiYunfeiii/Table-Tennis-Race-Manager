package edu.gdut.imis.byf3114004859.modules.race.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-12 11:03:42
 */
public class PointEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//
	private Long raceId;
	//
	private Long stageId;
	//
	private Long competitionId;
	//
	private Long roundId;
	//0
	private Integer point;
	//
	private Integer order;
	//
	private String unit;
	//1:比赛总得分 2:轮次得分 3:场次得分 4:局得分
	private Integer type;

	private Long userId;
	//
	private Integer bye;

	/**
	 * 设置：
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Long getId() {
		return id;
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
	public void setStageId(Long stageId) {
		this.stageId = stageId;
	}
	/**
	 * 获取：
	 */
	public Long getStageId() {
		return stageId;
	}
	/**
	 * 设置：
	 */
	public void setCompetitionId(Long competitionId) {
		this.competitionId = competitionId;
	}
	/**
	 * 获取：
	 */
	public Long getCompetitionId() {
		return competitionId;
	}
	/**
	 * 设置：
	 */
	public void setRoundId(Long roundId) {
		this.roundId = roundId;
	}
	/**
	 * 获取：
	 */
	public Long getRoundId() {
		return roundId;
	}
	/**
	 * 设置：0
	 */
	public void setPoint(Integer point) {
		this.point = point;
	}
	/**
	 * 获取：0
	 */
	public Integer getPoint() {
		return point;
	}
	/**
	 * 设置：
	 */
	public void setOrder(Integer order) {
		this.order = order;
	}
	/**
	 * 获取：
	 */
	public Integer getOrder() {
		return order;
	}
	/**
	 * 设置：
	 */
	public void setUnit(String unit) {
		this.unit = unit;
	}
	/**
	 * 获取：
	 */
	public String getUnit() {
		return unit;
	}
	/**
	 * 设置：1:比赛总得分 2:轮次得分 3:场次得分 4:局得分
	 */
	public void setType(Integer type) {
		this.type = type;
	}
	/**
	 * 获取：1:比赛总得分 2:轮次得分 3:场次得分 4:局得分
	 */
	public Integer getType() {
		return type;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Integer getBye() {
		return bye;
	}

	public boolean byeOrNot(){
		return bye == 1;
	}

	public void setBye(Integer bye) {
		this.bye = bye;
	}
}
