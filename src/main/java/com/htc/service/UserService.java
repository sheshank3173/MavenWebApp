package com.htc.service;

import java.util.HashMap;

import com.htc.model.Login;
import com.htc.model.User;

/*
 * basic comment
 */
public interface UserService {

  public void register(User user);

  public User validateUser(Login login);
  public HashMap<String, String> existingUsers();
  public void removeTestRegister(User testUser);
}
