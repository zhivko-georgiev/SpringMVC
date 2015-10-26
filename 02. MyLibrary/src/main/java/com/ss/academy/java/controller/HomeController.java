package com.ss.academy.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.academy.java.service.author.AuthorService;
import com.ss.academy.java.service.book.BookService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = {"/"})
public class HomeController {
	
	@Autowired
	AuthorService authorService;
	
	@Autowired
	BookService bookService;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/"})
	public String home(ModelMap model) {
		int authorsCount = authorService.findAllAuthors().size();
		int booksCount = bookService.findAllBooks().size();
		
		model.addAttribute("authorsCount", authorsCount);
		model.addAttribute("booksCount", booksCount);
		
		return "home";
	}
}