package edu.gdut.imis.byf3114004859.modules.race.controller;

import java.util.List;
import java.util.Map;

import edu.gdut.imis.byf3114004859.common.utils.PageUtils;
import edu.gdut.imis.byf3114004859.common.utils.Query;
import edu.gdut.imis.byf3114004859.common.utils.R;
import edu.gdut.imis.byf3114004859.modules.race.entity.CategoryEntity;
import edu.gdut.imis.byf3114004859.modules.race.service.CategoryService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


/**
 * 比赛分类
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-11-10 14:15:32
 */
@RestController
@RequestMapping("category")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("race:category:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<CategoryEntity> categoryList = categoryService.queryList(query);
		int total = categoryService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(categoryList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("race:category:info")
	public R info(@PathVariable("id") Long id){
		CategoryEntity category = categoryService.queryObject(id);
		
		return R.ok().put("category", category);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("race:category:save")
	public R save(@RequestBody CategoryEntity category){
		categoryService.save(category);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("race:category:update")
	public R update(@RequestBody CategoryEntity category){
		categoryService.update(category);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("race:category:delete")
	public R delete(@RequestBody Long[] ids){
		categoryService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
