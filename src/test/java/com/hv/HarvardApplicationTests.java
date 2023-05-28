package com.hv;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootTest
class HarvardApplicationTests {
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Test
	void contextLoads() {
System.out.println("Clave es :"+encoder.encode("123"));
		
	}

}
