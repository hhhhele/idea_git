/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.book.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.book.entity.Sort;
import com.thinkgem.jeesite.modules.book.dao.SortDao;

/**
 * 产品类别Service
 * @author yzyang
 * @version 2017-10-25
 */
@Service
@Transactional(readOnly = true)
public class SortService extends CrudService<SortDao, Sort> {

	public Sort get(String id) {
		return super.get(id);
	}
	
	public List<Sort> findList(Sort sort) {
		return super.findList(sort);
	}

	public List<Sort> findAll() {
		return dao.findAllList(new Sort());
	}
	
	public Page<Sort> findPage(Page<Sort> page, Sort sort) {
		return super.findPage(page, sort);
	}
	
	@Transactional(readOnly = false)
	public void save(Sort sort) {
		super.save(sort);
	}
	
	@Transactional(readOnly = false)
	public void delete(Sort sort) {
		super.delete(sort);
	}
	
}