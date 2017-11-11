package edu.gdut.imis.byf3114004859.modules.race.controller;

import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.common.utils.PageUtils;
import edu.gdut.imis.byf3114004859.common.utils.Query;
import edu.gdut.imis.byf3114004859.common.utils.R;
import edu.gdut.imis.byf3114004859.modules.race.service.RaceService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import edu.gdut.imis.byf3114004859.modules.race.entity.RaceEntity;


/**
 * 比赛
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-11-10 13:18:00
 */
@RestController
@RequestMapping("race")
public class RaceController {
	@Autowired
	private RaceService raceService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("race:race:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<RaceEntity> raceList = raceService.queryList(query);
		int total = raceService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(raceList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("race:race:info")
	public R info(@PathVariable("id") Long id){
		RaceEntity race = raceService.queryObject(id);
		
		return R.ok().put("race", race);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("race:race:save")
	public R save(@RequestBody RaceEntity race){
		raceService.save(race);
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("race:race:update")
	public R update(@RequestBody RaceEntity race){
		raceService.update(race);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("race:race:delete")
	public R delete(@RequestBody Long[] ids){
		raceService.deleteBatch(ids);
		
		return R.ok();
	}
	
}