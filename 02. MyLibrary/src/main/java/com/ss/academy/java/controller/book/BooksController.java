package com.ss.academy.java.controller.book;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.academy.java.model.author.Author;
import com.ss.academy.java.model.book.Book;
import com.ss.academy.java.model.book.BookStatus;
import com.ss.academy.java.service.author.AuthorService;
import com.ss.academy.java.service.book.BookService;

/**
 * Handles requests for the application authors' books page.
 */
@Controller
@RequestMapping(value = "/authors/{id}/books")
public class BooksController {

	@Autowired
	BookService bookService;
	
	@Autowired
	AuthorService authorService;

	/*
	 * This method will list all existing books.
	 */
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String listAllBooks(@PathVariable Long id, ModelMap model) {
		Author author = authorService.findById(id);
		List<Book> books = author.getBooks();
		
		if (books.size() == 0) {
			model.addAttribute("emptyList", true);
		}
		
		model.addAttribute("books", books);
		model.addAttribute("author", author);
		
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
		model.addAttribute("statuses", BookStatus.values());

		return "books/addNewBook";
	}

	/*
	 * This method will be called on form submission, handling POST request for
	 * saving book in database. It also validates the user input.
	 */
	@RequestMapping(value = { "/new" }, method = RequestMethod.POST)
	public String saveBook(@Valid Book book, BindingResult result, ModelMap model, @PathVariable Long id) {

		if (result.hasErrors()) {
			return "books/addNewBook";
		}

		Author author = authorService.findById(id);
		author.getBooks().add(book);
		book.setAuthor(author);
		bookService.saveBook(book);
		
		return "redirect:/authors/{id}/books/";
	}

	/*
	 * This method will provide the medium to update an existing book.
	 */
	@RequestMapping(value = { "/{book_id}" }, method = RequestMethod.GET)
	public String editBook(@PathVariable Long id, @PathVariable Long book_id, ModelMap model) {
		Book book = bookService.findById(book_id);
		Author author = book.getAuthor();
		
		model.addAttribute("book", book);
		model.addAttribute("author", author);
		model.addAttribute("edit", true);
		model.addAttribute("statuses", BookStatus.values());

		return "books/addNewBook";
	}

	/*
	 * This method will be called on form submission, handling POST request for
	 * updating book in database. It also validates the user input.
	 */
	@RequestMapping(value = { "/{book_id}" }, method = RequestMethod.PUT)
	public String updateBook(@Valid Book formBook, BindingResult result, ModelMap model, @PathVariable Long id,
			@PathVariable Long book_id) {

		if (result.hasErrors()) {
			return "books/addNewBook";
		}
		
		Author author = authorService.findById(id);
		Book  dbBook = bookService.findById(book_id);
		
		dbBook = formBook;

		bookService.updateBook(dbBook);
		author.getBooks().add(dbBook);
		
		return "redirect:/authors/{id}/books/";
	}

	/*
	 * This method will delete a book by it's ID value.
	 */
	@RequestMapping(value = { "/{book_id}" }, method = RequestMethod.DELETE)
	public String deleteBook(@PathVariable Long id, @PathVariable Long book_id) {
		Book book = bookService.findById(book_id);
		Author author = authorService.findById(id);
		
		author.getBooks().remove(book);
		bookService.deleteBook(book);
		
		return "redirect:/authors/{id}/books/";
	}
}
