package com.mtons.mblog;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ApplicationContext;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootApplication
@EnableCaching
public class StartApplication {
	 public static void main(String[] args) {
	        ApplicationContext context = SpringApplication.run(StartApplication.class, args);
	        String serverPort = context.getEnvironment().getProperty("server.port");
	      // log.info("mblog started at http://localhost:" + serverPort);
	    }
}
