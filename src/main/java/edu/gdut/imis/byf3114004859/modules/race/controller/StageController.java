package edu.gdut.imis.byf3114004859.modules.race.controller;

import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.common.utils.Param;
import edu.gdut.imis.byf3114004859.modules.race.entity.PointEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.PointService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import edu.gdut.imis.byf3114004859.modules.race.entity.StageEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.StageService;
import edu.gdut.imis.byf3114004859.common.utils.PageUtils;
import edu.gdut.imis.byf3114004859.common.utils.Query;
import edu.gdut.imis.byf3114004859.common.utils.R;


/**
 * 比赛轮次
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-11-11 21:13:22
 */
@RestController
@RequestMapping("stage")
public class StageController {
	@Autowired
	private StageService stageService;
	@Autowired
	private PointService pointService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("race:stage:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<StageEntity> stageList = stageService.queryList(query);

		int total = stageService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(stageList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("race:stage:info")
	public R info(@PathVariable("id") Long id){
		StageEntity stage = stageService.queryObject(id);
		
		return R.ok().put("stage", stage);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("race:stage:save")
	public R save(@RequestBody StageEntity stage){
		stageService.save(stage);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("race:stage:update")
	public R update(@RequestBody StageEntity stage){
		stageService.update(stage);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	public R delete(@RequestBody Long[] ids){
		stageService.deleteBatch(ids);
		
		return R.ok();
	}

	@RequestMapping("/finish")
	public R finish(@RequestBody StageEntity stage){
		return stageService.finish(stage);
	}

	@RequestMapping("/playerList")
	public R playerList(@RequestParam Map<String, Object> params){
		params.put("stageId", params.get("id"));
		//查询列表数据
		Query query = new Query(params);

		List<PointEntity> pointList = pointService.queryList(query);

		int total = pointService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(pointList, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}

	@RequestMapping("/start")
	public R start(@RequestBody StageEntity stage){
		stage = stageService.queryObject(stage.getId());
		stage.setStatus(2);
		stageService.update(stage);
		return R.ok();
	}

}
