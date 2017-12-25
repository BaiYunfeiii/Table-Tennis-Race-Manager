package edu.gdut.imis.byf3114004859.modules.sys.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import edu.gdut.imis.byf3114004859.modules.sys.entity.RegistedUserEntity;
import edu.gdut.imis.byf3114004859.modules.sys.service.RegistedUserService;
import edu.gdut.imis.byf3114004859.common.utils.PageUtils;
import edu.gdut.imis.byf3114004859.common.utils.Query;
import edu.gdut.imis.byf3114004859.common.utils.R;


/**
 * 
 * 
 * @author Bai Yunfei
 * @email baiyunfeiii@foxmail.com
 * @date 2017-11-08 22:54:44
 */
@RestController
@RequestMapping("registeduser")
public class RegistedUserController {
	@Autowired
	private RegistedUserService registedUserService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("registeduser:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

        query.put("deptId", 1);
		List<RegistedUserEntity> registedUserList = registedUserService.queryList(query);
		int total = registedUserService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(registedUserList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("registeduser:info")
	public R info(@PathVariable("id") Long id){
		RegistedUserEntity registedUser = registedUserService.queryObject(id);
		
		return R.ok().put("registedUser", registedUser);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("registeduser:save")
	public R save(@RequestBody RegistedUserEntity registedUser){
		registedUserService.save(registedUser);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("registeduser:update")
	public R update(@RequestBody RegistedUserEntity registedUser){
		registedUserService.update(registedUser);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("registeduser:delete")
	public R delete(@RequestBody Long[] ids){
		registedUserService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
