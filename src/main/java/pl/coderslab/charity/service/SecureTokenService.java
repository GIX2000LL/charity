package pl.coderslab.charity.service;

import pl.coderslab.charity.security.SecureToken;

public interface SecureTokenService {

    SecureToken createSecureToken();

    void saveSecureToken(final SecureToken token);

    SecureToken findByToken(final String token);

    void removeToken(final SecureToken token);

    void removeTokenByToken(final String token);
}