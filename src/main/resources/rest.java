package com.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bean.productBean;


@RestController
public class rest {

	
	
	@PostMapping("product")
    public productBean products(@RequestBody productBean product ) {
		
	
    return  product;
	}
}

                  