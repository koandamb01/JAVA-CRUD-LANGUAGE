package com.language.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.language.models.Language;
import com.language.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository languageRepo;
	
	public LanguageService(LanguageRepository languageRepo) {
		this.languageRepo = languageRepo;
	}
	
	// return all languages
	public List<Language> allLanguages(){ return languageRepo.findAll(); }
	
	// Create a language 
	public Language createLanguage(Language lang) { return languageRepo.save(lang); }
	
	// retrieve a language
	public Language findLanguage(Long id) {
		Optional<Language> optionalLang = languageRepo.findById(id);
		
		if(optionalLang.isPresent()) {
			return optionalLang.get();
		}else {
			return null;
		}
	}
	
	// retrieves a language and update it
	public Language updateLanguage(Long id, String name, String creator, String currentVersion) {
		// get the language by ID
		Language lang = this.findLanguage(id);
		
		if(lang == null) { return null; }
		
		// update the language now
		lang.setName(name);
		lang.setCreator(creator);
		lang.setCurrentVersion(currentVersion);
		
		// now save and return the language
		return languageRepo.save(lang);
	}
	
	public Language updateLanguage(Language lang) { return languageRepo.save(lang); }
	
	public void deleteLanguage(Long id) { languageRepo.deleteById(id); }
}
