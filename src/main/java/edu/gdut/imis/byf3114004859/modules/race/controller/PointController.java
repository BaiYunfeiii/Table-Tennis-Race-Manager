package edu.gdut.imis.byf3114004859.modules.race.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import edu.gdut.imis.byf3114004859.modules.race.entity.PointEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.PointService;
import edu.gdut.imis.byf3114004859.common.utils.PageUtils;
import edu.gdut.imis.byf3114004859.common.utils.Query;
import edu.gdut.imis.byf3114004859.common.utils.R;


/**
 * 
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-12 11:03:42
 */
@RestController
@RequestMapping("point")
public class PointController {
	@Autowired
	private PointService pointService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("point:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<PointEntity> pointList = pointService.queryList(query);
		int total = pointService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(pointList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("point:info")
	public R info(@PathVariable("id") Long id){
		PointEntity point = pointService.queryObject(id);
		
		return R.ok().put("point", point);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("point:save")
	public R save(@RequestBody PointEntity point){
		pointService.save(point);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("point:update")
	public R update(@RequestBody PointEntity point){
		pointService.update(point);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("point:delete")
	public R delete(@RequestBody Long[] ids){
		pointService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
