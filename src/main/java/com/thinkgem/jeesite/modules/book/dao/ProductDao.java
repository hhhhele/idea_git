/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.book.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.book.entity.Product;

/**
 * 产品管理DAO接口
 * @author yzyang
 * @version 2017-10-25
 */
@MyBatisDao
public interface ProductDao extends CrudDao<Product> {
	
}