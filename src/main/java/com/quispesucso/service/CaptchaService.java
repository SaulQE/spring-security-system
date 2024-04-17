package com.quispesucso.service;

public interface CaptchaService
{
    public abstract boolean isResponseValid(String clientIp, String response);
}
