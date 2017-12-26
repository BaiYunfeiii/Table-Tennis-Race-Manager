package edu.gdut.imis.byf3114004859.modules.race.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 比赛轮次
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-11-11 21:13:22
 */
public class StageEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public static final int TYPE_KNOCKOUT = 1;
	public static final int TYPE_ROUND = 2;
	public static final int TYPE_GROUP_ROUND = 3;

	//轮次id
	private Long id;
	//轮次名称
	private String name;
	//顺序
	private Integer order;
	//比赛id
	private Integer raceId;
	//所属比赛
	private RaceEntity race;
	//1:未开始 2:进行中 3:已结束
	private Integer status = 1;
	//1:淘汰赛 2:循环赛 3:小组循环赛
	private Integer type = 1;

	/**
	 * 设置：轮次id
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：轮次id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：轮次名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：轮次名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：顺序
	 */
	public void setOrder(Integer order) {
		this.order = order;
	}
	/**
	 * 获取：顺序
	 */
	public Integer getOrder() {
		return order;
	}
	/**
	 * 设置：比赛id
	 */
	public void setRaceId(Integer raceId) {
		this.raceId = raceId;
	}
	/**
	 * 获取：比赛id
	 */
	public Integer getRaceId() {
		return raceId;
	}
	/**
	 * 设置：1:未开始 2:进行中 3:已结束
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 * 获取：1:未开始 2:进行中 3:已结束
	 */
	public Integer getStatus() {
		return status;
	}

	public RaceEntity getRace() {
		return race;
	}

	public void setRace(RaceEntity race) {
		this.race = race;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
}
