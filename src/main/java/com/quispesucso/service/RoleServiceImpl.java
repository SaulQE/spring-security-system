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
	@Transactional
	public void insert(RoleEntity role) {
		repository.save(role);
	}

	@Override
	@Transactional
	public void update(RoleEntity role) {
		repository.save(role);
	}

	@Override
	@Transactional
	public void delete(Integer roleId) {
		repository.deleteById(roleId);
	}

	@Override
	@Transactional(readOnly = true)
	public RoleEntity findById(Integer roleId) {
		return repository.findById(roleId).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<RoleEntity> findAll() {
		return repository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Collection<RoleEntity> findAllOrderBy() {
		return repository.findAllOrderBy();
	}

}
