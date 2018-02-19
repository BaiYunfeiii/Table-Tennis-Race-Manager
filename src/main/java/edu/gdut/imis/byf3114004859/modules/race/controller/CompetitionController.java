package edu.gdut.imis.byf3114004859.modules.race.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.modules.race.dto.CompetitionDto;
import edu.gdut.imis.byf3114004859.modules.race.entity.StageEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.StageService;
import edu.gdut.imis.byf3114004859.modules.sys.service.ArrangeSerivce;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import edu.gdut.imis.byf3114004859.modules.race.entity.CompetitionEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.CompetitionService;
import edu.gdut.imis.byf3114004859.common.utils.PageUtils;
import edu.gdut.imis.byf3114004859.common.utils.Query;
import edu.gdut.imis.byf3114004859.common.utils.R;
import org.springframework.web.context.ContextLoader;


/**
 * 比赛场次
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-12-10 21:52:41
 */
@RestController
@RequestMapping("competition")
public class CompetitionController {
	@Autowired
	private CompetitionService competitionService;
	@Autowired
	private CompetitionDto dto;
	@Qualifier("arrangeServiceImpl")
	@Autowired
	private ArrangeSerivce arrangeSerivce;

	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("competition:list")
	public R list(@RequestParam Map<String, Object> params) {
		//查询列表数据
		Query query = new Query(params);

		List<CompetitionEntity> competitionList = competitionService.queryList(query);
		int total = competitionService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(competitionList, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("competition:info")
	public R info(@PathVariable("id") Long id){
		CompetitionEntity competition = competitionService.queryObject(id);
		
		return R.ok().put("competition", competition);
	}

	@RequestMapping("/infoWithRound/{id}")
	public R infoWithRound(@PathVariable("id") Long id){
		List<CompetitionEntity> competitionEntities = competitionService.queryByStage(id);
		List<CompetitionDto> dtoList = new ArrayList<>(competitionEntities.size());
		for (CompetitionEntity c:
			 competitionEntities) {
			dtoList.add(dto.build(c));
		}
		return R.ok().put("competitions", dtoList);
	}

	@RequestMapping("/arrange")
	public R arrange(@RequestBody StageEntity stage){
		Long id = stage.getId();
		return arrangeSerivce.arrange(stage.getId());
	}

	@RequestMapping("/finish")
	public R finish(@RequestBody CompetitionEntity competition){
		competition = competitionService.queryObject(competition.getId());
		if(competition == null){
			return R.error();
		}
		return competitionService.finish(competition);
	}

	@RequestMapping("/start")
	public R start(@RequestBody CompetitionEntity competition){
		competition = competitionService.queryObject(competition.getId());
		if(competition == null){
			return R.error();
		}
		competition.setStatus(2);
		competitionService.update(competition);
		return R.ok();
	}

	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("competition:save")
	public R save(@RequestBody CompetitionEntity competition){
		competitionService.save(competition);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("competition:update")
	public R update(@RequestBody CompetitionEntity competition){
		competitionService.update(competition);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("competition:delete")
	public R delete(@RequestBody Long[] ids){
		competitionService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
