package com.quispesucso.service;

import com.quispesucso.util.RecaptchaResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class CaptchaServiceImpl implements CaptchaService
{
    @Value("${google.recaptcha.key.secret}")
    String recaptchaSecret;

    private static final String GOOGLE_VERIFY_URL =
            "https://www.google.com/recaptcha/api/siteverify";

    @Override
    public boolean isResponseValid(String clientIp, String response) {
        RestTemplate restTemplate = new RestTemplate();
        MultiValueMap<String, String> requestMap = new LinkedMultiValueMap<>();
        requestMap.add("secret", recaptchaSecret);
        requestMap.add("response", response);
        requestMap.add("remoteip", clientIp);
        RecaptchaResponse recaptchaResponse = restTemplate.postForObject(
                GOOGLE_VERIFY_URL, requestMap, RecaptchaResponse.class);
        return recaptchaResponse.isSuccess();
    }
}
