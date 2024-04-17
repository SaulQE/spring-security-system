package com.quispesucso.service;

import com.quispesucso.entity.RoleEntity;
import com.quispesucso.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;

@Service
public class RoleServiceImpl implements RoleService 
{
	@Autowired
	private RoleRepository repository;

	@Override
	@Transactional(readOnly = true)
	public Collection<RoleEntity> findAll() {
		return repository.findAll();
	}

}
