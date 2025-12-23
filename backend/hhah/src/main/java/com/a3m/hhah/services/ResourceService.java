package com.a3m.hhah.services;

import com.a3m.hhah.entities.resources.Language;
import com.a3m.hhah.entities.resources.Resource;
import com.a3m.hhah.entities.resources.ResourceCategory;
import com.a3m.hhah.entities.resources.ResourceType;
import com.a3m.hhah.exceptions.ResourceNotFoundException;
import com.a3m.hhah.repositories.ResourceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResourceService {

    private final ResourceRepository resourceRepository;

    @Autowired
    public ResourceService(ResourceRepository resourceRepository) {
        this.resourceRepository = resourceRepository;
    }

    public Resource getResourceById(long id) {
        return resourceRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Resource not found."));
    }

    public List<Resource> getResourceByLanguageAndTypeAndCategory(Language language, ResourceType type, ResourceCategory category){
        return resourceRepository.findByLanguageAndTypeAndCategory(language, type, category);
    }

    public Resource createNewResource(String title, Language language, ResourceType type, ResourceCategory resourceCategory, String link) {
        Resource resource = new Resource(title, language, type, resourceCategory, link);
        resourceRepository.save(resource);
        return resource;
    }

}
