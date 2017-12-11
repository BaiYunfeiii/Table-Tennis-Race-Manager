package edu.gdut.imis.byf3114004859.modules.race.entity;

import java.io.Serializable;



/**
 * 比赛场次
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-10 21:52:41
 */
public class CompetitionEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//场次id
	private Long id;
	//场次名称
	private String name;
	//场地id
	private Long groundId;
	//场次进行顺序
	private Integer order;
	//局数
	private String gamesTotal;
	//轮次
	private StageEntity stage;
	/**
	 * 设置：场次id
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：场次id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：场次名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：场次名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：场地id
	 */
	public void setGroundId(Long groundId) {
		this.groundId = groundId;
	}
	/**
	 * 获取：场地id
	 */
	public Long getGroundId() {
		return groundId;
	}
	/**
	 * 设置：场次进行顺序
	 */
	public void setOrder(Integer order) {
		this.order = order;
	}
	/**
	 * 获取：场次进行顺序
	 */
	public Integer getOrder() {
		return order;
	}
	/**
	 * 设置：局数
	 */
	public void setGamesTotal(String gamesTotal) {
		this.gamesTotal = gamesTotal;
	}
	/**
	 * 获取：局数
	 */
	public String getGamesTotal() {
		return gamesTotal;
	}

	public StageEntity getStage() {
		return stage;
	}

	public void setStage(StageEntity stage) {
		this.stage = stage;
	}
}
