// package com.spam9700.spam.security;

// import org.springframework.context.annotation.Bean;
// import org.springframework.context.annotation.Configuration;
// import org.springframework.security.config.Customizer;
// import org.springframework.security.config.annotation.web.builders.HttpSecurity;
// import org.springframework.security.web.SecurityFilterChain;

// @Configuration
// public class SecurityConfiguration {

//     @Bean
//     public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//         // ensure that all request authenticated
//         http.authorizeHttpRequests(
//                 auth -> auth.anyRequest().authenticated());

//         // for restapi, enable basic authentication
//         http.httpBasic(Customizer.withDefaults());

//         // CSRF -> POST, Put
//         http.csrf().disable();

//         return http.build();
//     }

// }
