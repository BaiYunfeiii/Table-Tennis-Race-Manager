package edu.gdut.imis.byf3114004859.modules.race.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 场地
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-12 11:03:41
 */
public class GroundEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//场地名称
	private String name;
	//场地种类
	private Long categoryId;

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
	 * 设置：场地名称
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：场地名称
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：场地种类
	 */
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	/**
	 * 获取：场地种类
	 */
	public Long getCategoryId() {
		return categoryId;
	}
}
