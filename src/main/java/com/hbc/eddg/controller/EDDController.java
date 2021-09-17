package com.hbc.eddg.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class EDDController {
    @GetMapping("")
    public ResponseEntity<String> getEdd() {
        return ResponseEntity.ok().body("Hello world");
    }
}
