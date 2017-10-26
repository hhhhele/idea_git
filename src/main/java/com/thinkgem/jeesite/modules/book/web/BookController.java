/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.book.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.book.entity.Book;
import com.thinkgem.jeesite.modules.book.service.BookService;

/**
 * 图书管理模块Controller
 * @author yzyang
 * @version 2017-10-24
 */
@Controller
@RequestMapping(value = "${adminPath}/book/book")
public class BookController extends BaseController {

	@Autowired
	private BookService bookService;
	
	@ModelAttribute
	public Book get(@RequestParam(required=false) String id) {
		Book entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = bookService.get(id);
		}
		if (entity == null){
			entity = new Book();
		}
		return entity;
	}
	
	@RequiresPermissions("book:book:view")
	@RequestMapping(value = {"list", ""})
	public String list(Book book, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Book> page = bookService.findPage(new Page<Book>(request, response), book); 
		model.addAttribute("page", page);
		return "modules/book/bookList";
	}

	@RequiresPermissions("book:book:view")
	@RequestMapping(value = "form")
	public String form(Book book, Model model) {
		model.addAttribute("book", book);
		return "modules/book/bookForm";
	}

	@RequiresPermissions("book:book:edit")
	@RequestMapping(value = "save")
	public String save(Book book, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, book)){
			return form(book, model);
		}
		bookService.save(book);
		addMessage(redirectAttributes, "保存图书成功");
		return "redirect:"+Global.getAdminPath()+"/book/book/?repage";
	}
	
	@RequiresPermissions("book:book:edit")
	@RequestMapping(value = "delete")
	public String delete(Book book, RedirectAttributes redirectAttributes) {
		bookService.delete(book);
		addMessage(redirectAttributes, "删除图书成功");
		return "redirect:"+Global.getAdminPath()+"/book/book/?repage";
	}

}