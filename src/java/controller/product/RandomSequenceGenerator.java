package controller.product;

import java.security.SecureRandom;

/**
 *
 * @author Yanna
 */
public class RandomSequenceGenerator {
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    public static String generateRandomSequence(int length) {
        StringBuilder randomSequence = new StringBuilder(length);
        SecureRandom secureRandom = new SecureRandom();

        for (int i = 0; i < length; i++) {
            int randomIndex = secureRandom.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(randomIndex);
            randomSequence.append(randomChar);
        }

        return randomSequence.toString();
    }
}
