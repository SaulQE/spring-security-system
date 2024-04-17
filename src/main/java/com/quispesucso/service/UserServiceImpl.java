package com.quispesucso.service;

import com.quispesucso.entity.RoleEntity;
import com.quispesucso.entity.UserEntity;
import com.quispesucso.repository.RoleRepository;
import com.quispesucso.repository.UserRepository;
import com.quispesucso.util.RoleType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;

@Service
public class UserServiceImpl implements UserService, UserDetailsService
{

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Override
    @Transactional
    public void insert(UserEntity user)
    {
        //Cifrar password
        String bCrypt = new BCryptPasswordEncoder().encode(user.getPassword());
        user.setPassword(bCrypt);

        //Asignar rol por defecto
        RoleEntity defaultRole = roleRepository.findByTipo(RoleType.USER.name());
        user.getItemsRole().add(defaultRole);

        userRepository.save(user);
    }

    @Override
    @Transactional(readOnly = true)
    public UserEntity findById(Integer userId) {
        return userRepository.findById(userId).orElse(null);
    }

    @Override
    @Transactional(readOnly = true)
    public UserEntity findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
    {
        UserEntity userDb = this.findByUsername(username);

        if(userDb != null)
        {
            Collection<GrantedAuthority> authorities = new ArrayList<>();

            // Roles del usuario
            for(RoleEntity role:userDb.getItemsRole())
                authorities.add(new SimpleGrantedAuthority("ROLE_"+role.getTipo()));

            //usuario preparado
            User user = new User(userDb.getUsername(), userDb.getPassword(), userDb.getState().equals("ACTIVE"), true, true, true, authorities);

            return user;
        }

        throw new UsernameNotFoundException("Username "+username+" no existe");
    }
}
