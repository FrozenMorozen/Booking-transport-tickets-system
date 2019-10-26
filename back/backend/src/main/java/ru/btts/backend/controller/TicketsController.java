package ru.btts.backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("/tickets")
public class TicketsController {

		@GetMapping
		public String helloGradle() {
				return "Hello Gradle!";
		}


}
