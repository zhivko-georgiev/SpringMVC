package com.ss.academy.java.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.academy.java.model.Book;
import com.ss.academy.java.service.BookService;

@Controller
@RequestMapping({ "/books" })
public class BooksController {

	@Autowired
	BookService service;

	@Autowired
	MessageSource messageSource;

	/*
	 * This method will list all existing books.
	 */
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String listAllBooks(ModelMap model) {
		List<Book> books = service.findAllBooks();
		model.addAttribute("books", books);

		return "books/all";
	}

	/*
	 * This method will provide the medium to add a new book.
	 */
	@RequestMapping(value = { "/new" }, method = RequestMethod.GET)
	public String addNewBook(ModelMap model) {
		Book book = new Book();
		model.addAttribute("book", book);
		model.addAttribute("edit", false);

		return "books/addNewBook";
	}

	/*
	 * This method will be called on form submission, handling POST request for
	 * saving book in database. It also validates the user input
	 */
	@RequestMapping(value = { "/new" }, method = RequestMethod.POST)
	public String saveBook(@Valid Book book, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			return "books/addNewBook";
		}

		service.saveBook(book);

		model.addAttribute("success", "Book " + book.getTitle() + " registered successfully");
		model.addAttribute("bookList", true);

		return "success";
	}

	/*
	 * This method will provide the medium to update an existing book.
	 */
	@RequestMapping(value = { "/edit-{id}-book" }, method = RequestMethod.GET)
	public String editBook(@PathVariable Long id, ModelMap model) {
		Book book = service.findById(id);
		model.addAttribute("book", book);
		model.addAttribute("edit", true);

		return "books/addNewBook";
	}

	/*
	 * This method will be called on form submission, handling POST request for
	 * updating book in database. It also validates the user input
	 */
	@RequestMapping(value = { "/edit-{id}-book" }, method = RequestMethod.POST)
	public String updateBook(@Valid Book book, BindingResult result, ModelMap model, @PathVariable Long id) {

		if (result.hasErrors()) {
			return "books/addNewBook";
		}

		service.updateBook(book);

		model.addAttribute("success", "Book " + book.getTitle() + " updated successfully");
		model.addAttribute("bookList", true);

		return "success";
	}

	/*
	 * This method will delete an book by it's ID value.
	 */
	@RequestMapping(value = { "/delete-{id}-book" }, method = RequestMethod.GET)
	public String deleteBook(@PathVariable Long id) {
		service.deleteBook(service.findById(id));

		return "redirect:/books/";
	}
}
