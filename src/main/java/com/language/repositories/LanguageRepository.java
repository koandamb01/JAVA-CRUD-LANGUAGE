package com.language.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.language.models.Language;

public interface LanguageRepository extends CrudRepository<Language, Long> {
    // this method retrieves all the languages from the database
	List<Language> findAll();
	
	
	// You dont really need to put anything in here. Just make sure you extends from the CrudRepository
}
