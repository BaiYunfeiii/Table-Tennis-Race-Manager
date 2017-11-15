package edu.gdut.imis.byf3114004859.modules.race.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * 比赛
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-11-10 13:18:00
 */
public class RaceEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//比赛id
	private Long id;
	//比赛名称
	private String name;
	//比赛类型
	private CategoryEntity category;
	//开始时间
	private Date startTime;
	//结束时间
	private Date endTime;
	//活动地点
	private String place;
	//活动详情
	private String details;
	//活动状态 1:未开始 2:进行中 3:已结束
	private Integer status;
	//创建者
	private Long createUserId;
	//创建时间
	private Date createTime;

	private List<StageEntity> stageList;

	/**
	 * 设置：比赛id
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：比赛id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：比赛名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：比赛名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：开始时间
	 */
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	/**
	 * 获取：开始时间
	 */
	public Date getStartTime() {
		return startTime;
	}
	/**
	 * 设置：结束时间
	 */
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	/**
	 * 获取：结束时间
	 */
	public Date getEndTime() {
		return endTime;
	}
	/**
	 * 设置：活动地点
	 */
	public void setPlace(String place) {
		this.place = place;
	}
	/**
	 * 获取：活动地点
	 */
	public String getPlace() {
		return place;
	}
	/**
	 * 设置：活动详情
	 */
	public void setDetails(String details) {
		this.details = details;
	}
	/**
	 * 获取：活动详情
	 */
	public String getDetails() {
		return details;
	}
	/**
	 * 设置：活动状态 1:未开始 2:进行中 3:已结束
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 * 获取：活动状态 1:未开始 2:进行中 3:已结束
	 */
	public Integer getStatus() {
		return status;
	}
	/**
	 * 设置：创建者
	 */
	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}
	/**
	 * 获取：创建者
	 */
	public Long getCreateUserId() {
		return createUserId;
	}
	/**
	 * 设置：创建时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	/**
	 * 获取：创建时间
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * 获取比赛分类
	 * @return 比赛分类
	 */
	public CategoryEntity getCategory() {
		return category;
	}

	/**
	 * 获取比赛下的所有轮次
	 * @return
	 */
	public List<StageEntity> getStageList() {
		return stageList;
	}
}
