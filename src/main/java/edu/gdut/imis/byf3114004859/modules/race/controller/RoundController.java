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

import edu.gdut.imis.byf3114004859.modules.race.entity.RoundEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.RoundService;
import edu.gdut.imis.byf3114004859.common.utils.PageUtils;
import edu.gdut.imis.byf3114004859.common.utils.Query;
import edu.gdut.imis.byf3114004859.common.utils.R;


/**
 * 
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-12 23:29:59
 */
@RestController
@RequestMapping("round")
public class RoundController {
	@Autowired
	private RoundService roundService;

	@RequestMapping("/listByCompetition")
	@RequiresPermissions("round:list")
	public R listByCompetition(@RequestParam Long id){
		return R.ok().put("rounds", roundService.queryByCompetition(id));
	}
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("round:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<RoundEntity> roundList = roundService.queryList(query);
		int total = roundService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(roundList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{roundId}")
	@RequiresPermissions("round:info")
	public R info(@PathVariable("roundId") Long roundId){
		RoundEntity round = roundService.queryObject(roundId);
		
		return R.ok().put("round", round);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("round:save")
	public R save(@RequestBody RoundEntity round){
		roundService.save(round);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("round:update")
	public R update(@RequestBody RoundEntity round){
		roundService.update(round);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("round:delete")
	public R delete(@RequestBody Long[] roundIds){
		roundService.deleteBatch(roundIds);
		
		return R.ok();
	}
	
}
