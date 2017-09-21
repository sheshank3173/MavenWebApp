package com.htc.service;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.htc.model.Login;
import com.htc.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/Spring-Context.xml")
public class UserServiceTest {

	@Autowired
	private UserService userService;
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		Login login = new Login();
		login.setUsername("gopi");
		login.setPassword("password");
		if(userService.validateUser(login)!=null){
			System.out.println("Login Test Success...");
		}
	}

	@Test
	public void test2() {
		User user=new User();
		user.setAddress("Chennai");
		user.setEmail("test@htcindia.com");
		user.setFirstname("TestFirstName");
		user.setLastname("TestLastName");
		user.setPassword("TestPass");
		user.setUsername("Testing");
		user.setPhone(123123123);
		userService.register(user);
		userService.removeTestRegister(user);
		System.out.println("Register Test Success...");
	}
}
