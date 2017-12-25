package edu.gdut.imis.byf3114004859.modules.race.controller;

import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.common.utils.PageUtils;
import edu.gdut.imis.byf3114004859.common.utils.Query;
import edu.gdut.imis.byf3114004859.common.utils.R;
import edu.gdut.imis.byf3114004859.modules.sys.shiro.ShiroUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import edu.gdut.imis.byf3114004859.modules.race.entity.EnrollEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.EnrollService;


/**
 * 
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-25 15:52:50
 */
@RestController
@RequestMapping("enroll")
public class EnrollController {
	@Autowired
	private EnrollService enrollService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/enrolledList")
	@RequiresPermissions("guest:enroll:list")
	public R enrolledList(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

        Long userId = ShiroUtils.getUserId();
        params.put("userId", userId);

		List<EnrollEntity> enrollList = enrollService.queryList(query);
		int total = enrollService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(enrollList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{enrollId}")
	@RequiresPermissions("enroll:info")
	public R info(@PathVariable("enrollId") Long enrollId){
		EnrollEntity enroll = enrollService.queryObject(enrollId);
		
		return R.ok().put("enroll", enroll);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("enroll:save")
	public R save(@RequestBody EnrollEntity enroll){
		enrollService.save(enroll);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("enroll:update")
	public R update(@RequestBody EnrollEntity enroll){
		enrollService.update(enroll);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("enroll:delete")
	public R delete(@RequestBody Long[] enrollIds){
		enrollService.deleteBatch(enrollIds);
		
		return R.ok();
	}
	
}
