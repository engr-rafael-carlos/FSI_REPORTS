package fsi.classes;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.Date;
import java.util.Random;

/**
 * Created by agile_server on 8/11/2015.
 */
public class HashPassword {
    public static String encrypt_to_sha(String password) {
        String encrypted = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            byte[] bytes = md.digest();
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            encrypted = sb.toString();
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return encrypted;
    }

    public static String encrypt_to_salt(String password) {
        Random rand = new Random((new Date()).getTime());
        BASE64Encoder encoder = new BASE64Encoder();
        byte[] salt = new byte[8];
        rand.nextBytes(salt);
        String encrypted = encoder.encode(salt) + encoder.encode(password.getBytes());
        return encrypted;
    }

    public static String decrypt_salt(String encrypted) {
        String decrypt = null;
        if (encrypted.length() > 12) {
            String cipher = encrypted.substring(12);
            BASE64Decoder decoder = new BASE64Decoder();
            try {
                decrypt = new String(decoder.decodeBuffer(cipher));
            } catch (IOException e) {
                System.out.println(e);
            }
        }
        return decrypt;
    }
}
