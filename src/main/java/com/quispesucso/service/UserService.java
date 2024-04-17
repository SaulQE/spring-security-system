package com.quispesucso.service;

import com.quispesucso.entity.UserEntity;

public interface UserService 
{
	public abstract void insert(UserEntity user);
	public abstract UserEntity findById(Integer userId);
	public abstract UserEntity findByUsername(String username);
	
}
