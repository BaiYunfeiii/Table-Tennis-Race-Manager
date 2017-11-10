package edu.gdut.imis.byf3114004859.modules.sys.entity;

import java.io.Serializable;


/**
 * 
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-11-08 22:54:44
 */
public class RegistedUserEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//注册用户id
	private Long id;
	//对应的系统用户
	private SysUserEntity user;
	//昵称
	private String nickname;
	//姓名
	private String name;
	//学校
	private String school;
	//学院
	private String institute;
	//专业
	private String major;
	//年级
	private String grade;
	//班级名称
	private String classname;
	//状态
	private String status;

	/**
	 * 设置：注册用户id
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：注册用户id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：对应的系统用户id
	 */
	public void setUser(SysUserEntity user) {
		this.user = user;
	}
	/**
	 * 获取：对应的系统用户id
	 */
	public SysUserEntity getUser() {
		return user;
	}
	/**
	 * 设置：昵称
	 */
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	/**
	 * 获取：昵称
	 */
	public String getNickname() {
		return nickname;
	}
	/**
	 * 设置：姓名
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：姓名
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：学校
	 */
	public void setSchool(String school) {
		this.school = school;
	}
	/**
	 * 获取：学校
	 */
	public String getSchool() {
		return school;
	}
	/**
	 * 设置：学院
	 */
	public void setInstitute(String institute) {
		this.institute = institute;
	}
	/**
	 * 获取：学院
	 */
	public String getInstitute() {
		return institute;
	}
	/**
	 * 设置：专业
	 */
	public void setMajor(String major) {
		this.major = major;
	}
	/**
	 * 获取：专业
	 */
	public String getMajor() {
		return major;
	}
	/**
	 * 设置：年级
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}
	/**
	 * 获取：年级
	 */
	public String getGrade() {
		return grade;
	}
	/**
	 * 设置：班级名称
	 */
	public void setClassname(String classname) {
		this.classname = classname;
	}
	/**
	 * 获取：班级名称
	 */
	public String getClassname() {
		return classname;
	}
	/**
	 * 设置：状态
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * 获取：状态
	 */
	public String getStatus() {
		return status;
	}
}
