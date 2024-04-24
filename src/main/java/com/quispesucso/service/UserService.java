package com.quispesucso.service;

import com.quispesucso.entity.UserEntity;

import java.util.Collection;

public interface UserService 
{
	public abstract void insert(UserEntity user);
	public abstract void update(UserEntity user);
	public abstract void delete(Integer userId);
	public abstract UserEntity findById(Integer userId);
	public abstract Collection<UserEntity> findAll();
	public abstract UserEntity findByUsername(String username);
	
}
