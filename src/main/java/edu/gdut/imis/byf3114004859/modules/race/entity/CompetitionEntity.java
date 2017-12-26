package edu.gdut.imis.byf3114004859.modules.race.entity;

import edu.gdut.imis.byf3114004859.modules.sys.entity.SysUserEntity;

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
	private Integer gamesTotal;
	//轮次
	private StageEntity stage;
	//比赛场地
	private GroundEntity ground;

	private Long StageId;

	private Long winnerId;

	private SysUserEntity host;
	private Long hostId;
	private SysUserEntity guest;
	private Long guestId;
	private Integer hostPoint;
	private Integer guestPoint;
	//1:未开始 2:进行中 3:已结束
	private Integer status = 1;
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
	public void setGamesTotal(Integer gamesTotal) {
		this.gamesTotal = gamesTotal;
	}
	/**
	 * 获取：局数
	 */
	public Integer getGamesTotal() {
		return gamesTotal;
	}

	public StageEntity getStage() {
		return stage;
	}

	public void setStage(StageEntity stage) {
		this.stage = stage;
	}

	public GroundEntity getGround() {
		return ground;
	}

	public void setGround(GroundEntity ground) {
		this.ground = ground;
	}

	public SysUserEntity getHost() {
		return host;
	}

	public void setHost(SysUserEntity host) {
		this.host = host;
	}

	public SysUserEntity getGuest() {
		return guest;
	}

	public void setGuest(SysUserEntity guest) {
		this.guest = guest;
	}

	public Integer getHostPoint() {
		return hostPoint;
	}

	public void setHostPoint(Integer hostPoint) {
		this.hostPoint = hostPoint;
	}

	public Integer getGuestPoint() {
		return guestPoint;
	}

	public void setGuestPoint(Integer guestPoint) {
		this.guestPoint = guestPoint;
	}

	public Long getWinnerId() {
		return winnerId;
	}

	public void setWinnerId(Long winnerId) {
		this.winnerId = winnerId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public boolean isEnd(){
		return getStatus() == 3;
	}

	public boolean isStarted(){
		return getStatus() >= 2;
	}

	public Long getHostId() {
		return hostId;
	}

	public void setHostId(Long hostId) {
		this.hostId = hostId;
	}

	public Long getGuestId() {
		return guestId;
	}

	public void setGuestId(Long guestId) {
		this.guestId = guestId;
	}

	public Long getStageId() {
		return StageId;
	}

	public void setStageId(Long stageId) {
		StageId = stageId;
	}
}
