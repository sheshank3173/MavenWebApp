package com.htc.service;

import com.htc.model.Login;
import com.htc.model.User;

public interface UserService {

  void register(User user);

  User validateUser(Login login);
}
