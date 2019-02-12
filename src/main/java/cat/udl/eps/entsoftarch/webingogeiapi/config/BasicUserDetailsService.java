package cat.udl.eps.entsoftarch.webingogeiapi.config;

import cat.udl.eps.entsoftarch.webingogeiapi.domain.User;
import cat.udl.eps.entsoftarch.webingogeiapi.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class BasicUserDetailsService implements UserDetailsService {

  @Autowired
  UserRepository userRepository;

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    User user = userRepository.findByUsername(username);
    if (user == null) {
      throw new UsernameNotFoundException("Not found user with username: " + username);
    }
    return user;
  }
}
