package edu.gdut.imis.byf3114004859.modules.race.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-12 23:29:59
 */
public class RoundEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//小局id
	private Long roundId;
	//主场
	private Integer hostId;
	//客场
	private Integer guestId;
	//主场得分
	private Integer hostPoint;
	//客场得分
	private Integer guestPoint;
	//场次
	private Long competitionId;
	//小局顺序
	private Integer order;

	/**
	 * 设置：小局id
	 */
	public void setRoundId(Long roundId) {
		this.roundId = roundId;
	}
	/**
	 * 获取：小局id
	 */
	public Long getRoundId() {
		return roundId;
	}
	/**
	 * 设置：主场
	 */
	public void setHostId(Integer hostId) {
		this.hostId = hostId;
	}
	/**
	 * 获取：主场
	 */
	public Integer getHostId() {
		return hostId;
	}
	/**
	 * 设置：客场
	 */
	public void setGuestId(Integer guestId) {
		this.guestId = guestId;
	}
	/**
	 * 获取：客场
	 */
	public Integer getGuestId() {
		return guestId;
	}
	/**
	 * 设置：主场得分
	 */
	public void setHostPoint(Integer hostPoint) {
		this.hostPoint = hostPoint;
	}
	/**
	 * 获取：主场得分
	 */
	public Integer getHostPoint() {
		return hostPoint;
	}
	/**
	 * 设置：客场得分
	 */
	public void setGuestPoint(Integer guestPoint) {
		this.guestPoint = guestPoint;
	}
	/**
	 * 获取：客场得分
	 */
	public Integer getGuestPoint() {
		return guestPoint;
	}
	/**
	 * 设置：场次
	 */
	public void setCompetitionId(Long competitionId) {
		this.competitionId = competitionId;
	}
	/**
	 * 获取：场次
	 */
	public Long getCompetitionId() {
		return competitionId;
	}
	/**
	 * 设置：小局顺序
	 */
	public void setOrder(Integer order) {
		this.order = order;
	}
	/**
	 * 获取：小局顺序
	 */
	public Integer getOrder() {
		return order;
	}
}
