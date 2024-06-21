package com.example.assignment01.service;

import com.example.assignment01.entity.Role;
import com.example.assignment01.entity.User;
import com.example.assignment01.form.CreateUserForm;
import com.example.assignment01.form.UpdateUserForm;
import com.example.assignment01.repository.IRoleRepository;
import com.example.assignment01.repository.IUserRepository;
import com.example.assignment01.specification.user.UserSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserService implements IUserService {

    private final IUserRepository userRepository;
    private final IRoleRepository roleRepository;
    private  BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public UserService(IUserRepository userRepository, IRoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @Override
    public User getUserByUsername(String username) {
        return userRepository.findByEmail(username);

    }

    @Override
    public List<User> findAllUser() {
        return userRepository.findAll();
    }


    @Override
    public Page<User> findAllUser(Pageable pageable, String search) {
        Specification<User> where = UserSpecification.buildWhere(search);
        return userRepository.findAll(where, pageable);
    }

    @Override
    public User getUserById(int id) {
        Optional<User> optionalUser = userRepository.findById(id);
        return optionalUser.orElseThrow(() -> new RuntimeException("Không tìm thấy User có ID là :" + id));
    }

    @Override
    public void lockOrUnlock(int id) {
        Optional<User> optionalUser = userRepository.findById(id);
        User user = optionalUser.orElseThrow(() -> new RuntimeException("Không tìm thấy User có ID là :" + id));
        user.setStatus(user.getStatus() == 1 ? 0 : 1);
        userRepository.save(user);
    }

    @Override
    public void createUser(CreateUserForm form) {
        User user = addNewUser(form);
        userRepository.save(user);
    }

    private User addNewUser(CreateUserForm form) {
        User user = new User();
        user.setNote(form.getNote());
        user.setFullName(form.getFullName());
        user.setPhoneNumber(form.getPhoneNumber());
        user.setUserName(form.getUserName());
        user.setEmail(form.getEmail());
        user.setAddress(form.getAddress());
        user.setPassWord(bCryptPasswordEncoder.encode(form.getPassword()));
        Optional<Role> optionalRole = roleRepository.findById(form.getIdRole());
        if (optionalRole.isEmpty()) throw new RuntimeException("Not found role");
        user.setRole(optionalRole.get());
        return user;
    }

    @Override
    public void updateUser(UpdateUserForm form) {
        Optional<User> optionalUser = userRepository.findById(form.getId());
        User user = optionalUser.orElseThrow(() -> new RuntimeException("Không tìm thấy User có ID là :" + form.getId()));
        user = asUser(user, form);
        userRepository.save(user);
    }

    private User asUser(User user, UpdateUserForm form) {
        user.setAddress(form.getAddress());
        user.setFullName(form.getFullName());
        user.setPhoneNumber(form.getPhoneNumber());
        Optional<Role> optionalRole = roleRepository.findById(form.getIdRole());
        if (optionalRole.isEmpty()) throw new RuntimeException("Not found role");
        user.setRole(optionalRole.get());
        return user;
    }

    @Override
    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(username);
        if (user == null) {
            throw new UsernameNotFoundException("Username not found");
        }
        if (user.getStatus() == 0) { // If status is 0, account is locked
            throw new LockedException("User account is locked");
        }
        return new org.springframework.security.core.userdetails.User(
                user.getEmail(),
                user.getPassWord(),
                user.getStatus() == 1, // account is enabled if status is 1
                true, // accountNonExpired
                true, // credentialsNonExpired
                true, // accountNonLocked
                mapRolesToAuthorities(user.getRole())
        );
    }


    private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Role role) {
        return List.of(new SimpleGrantedAuthority(role.getRoleName()));
    }
}
