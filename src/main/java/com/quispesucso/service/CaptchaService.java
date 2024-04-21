package com.quispesucso.service;

public interface CaptchaService
{
    // Método para verificar si la respuesta es válida
    public abstract boolean isResponseValid(String clientIp, String response);
}
