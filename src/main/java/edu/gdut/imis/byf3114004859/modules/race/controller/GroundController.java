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

import edu.gdut.imis.byf3114004859.modules.race.entity.GroundEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.GroundService;
import edu.gdut.imis.byf3114004859.common.utils.PageUtils;
import edu.gdut.imis.byf3114004859.common.utils.Query;
import edu.gdut.imis.byf3114004859.common.utils.R;


/**
 * 场地
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-12 11:03:41
 */
@RestController
@RequestMapping("ground")
public class GroundController {
	@Autowired
	private GroundService groundService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("ground:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<GroundEntity> groundList = groundService.queryList(query);
		int total = groundService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(groundList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("ground:info")
	public R info(@PathVariable("id") Long id){
		GroundEntity ground = groundService.queryObject(id);
		
		return R.ok().put("ground", ground);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("ground:save")
	public R save(@RequestBody GroundEntity ground){
		groundService.save(ground);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("ground:update")
	public R update(@RequestBody GroundEntity ground){
		groundService.update(ground);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("ground:delete")
	public R delete(@RequestBody Long[] ids){
		groundService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
