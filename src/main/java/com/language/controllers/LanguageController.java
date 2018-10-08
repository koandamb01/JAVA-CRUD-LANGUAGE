package com.language.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.language.models.Language;
import com.language.services.LanguageService;

@Controller
public class LanguageController {
	private final LanguageService langService;
	
	public LanguageController(LanguageService langService) {
		this.langService = langService;
	}
	
	@RequestMapping("/")
	public String Index(Model model, @ModelAttribute("language") Language language) {
		List<Language> lang = langService.allLanguages();
		model.addAttribute("languages", lang);
		return "index.jsp";
	}
	
	
	@RequestMapping(value="/newLanguage", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("language") Language lang, BindingResult result) {
		if(result.hasErrors()) {
			return "index.jsp";
		}else {
			langService.createLanguage(lang);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/language/{id}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("id") Long id) {
		langService.deleteLanguage(id);
		return "redirect:/";
	}
	
	@RequestMapping(value="/language/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Language lang = langService.findLanguage(id);
		model.addAttribute("language", lang);
		return "edit.jsp";
	}
	
	@RequestMapping(value="/language/{id}/update", method=RequestMethod.PUT)
	public String updateLanguage(@Valid @ModelAttribute("language") Language lang, BindingResult result) {
		langService.updateLanguage(lang);
		return "redirect:/";
	}
	
	@RequestMapping("/language/{id}/show")
	public String show(@PathVariable("id") Long id, Model model) {
		Language lang = langService.findLanguage(id);
		model.addAttribute("language", lang);
		return "show.jsp";
	}
}
