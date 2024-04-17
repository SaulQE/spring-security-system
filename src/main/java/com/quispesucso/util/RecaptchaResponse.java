package com.quispesucso.util;

import com.fasterxml.jackson.annotation.JsonProperty;

public class RecaptchaResponse {
    private boolean success;
    private String challengeTs;
    private String hostname;

    @JsonProperty("error-codes")
    private String[] errorCodes;

    public RecaptchaResponse() {
    }

    public RecaptchaResponse(boolean success, String challengeTs, String hostname, String[] errorCodes) {
        this.success = success;
        this.challengeTs = challengeTs;
        this.hostname = hostname;
        this.errorCodes = errorCodes;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getChallengeTs() {
        return challengeTs;
    }

    public void setChallengeTs(String challengeTs) {
        this.challengeTs = challengeTs;
    }

    public String getHostname() {
        return hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }

    public String[] getErrorCodes() {
        return errorCodes;
    }

    public void setErrorCodes(String[] errorCodes) {
        this.errorCodes = errorCodes;
    }
}
