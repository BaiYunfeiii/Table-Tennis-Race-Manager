package edu.gdut.imis.byf3114004859.modules.race.entity;

import edu.gdut.imis.byf3114004859.modules.sys.entity.SysUserEntity;

import java.io.Serializable;
import java.util.Date;



/**
 * 比赛分类
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-11-10 14:15:32
 */
public class CategoryEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//分类名称
	private String name;
	//创建用户
	private SysUserEntity createUser;
	//创建时间
	private Date createTime;

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
	 * 设置：分类名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：分类名称
	 */
	public String getName() {
		return name;
	}

	/**
	 * 获取创建者
	 * @return
	 */
	public SysUserEntity getCreateUser() {
		return createUser;
	}

	/**
	 * 设置创建者
	 * @param createUser　创建者
	 */
	public void setCreateUser(SysUserEntity createUser) {
		this.createUser = createUser;
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
}
