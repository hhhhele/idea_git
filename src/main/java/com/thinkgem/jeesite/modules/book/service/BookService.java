/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.book.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.book.entity.Book;
import com.thinkgem.jeesite.modules.book.dao.BookDao;

/**
 * 图书管理模块Service
 * @author yzyang
 * @version 2017-10-24
 */
@Service
@Transactional(readOnly = true)
public class BookService extends CrudService<BookDao, Book> {

	public Book get(String id) {
		return super.get(id);
	}
	
	public List<Book> findList(Book book) {
		return super.findList(book);
	}
	
	public Page<Book> findPage(Page<Book> page, Book book) {
		return super.findPage(page, book);
	}
	
	@Transactional(readOnly = false)
	public void save(Book book) {
		super.save(book);
	}
	
	@Transactional(readOnly = false)
	public void delete(Book book) {
		super.delete(book);
	}
	
}