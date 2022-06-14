package com.its.member.service;

import com.its.member.repository.RecipeRepository;
import com.its.member.repository.WesternRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WesternService {
    @Autowired
    private WesternRepository westernRepository;
}
