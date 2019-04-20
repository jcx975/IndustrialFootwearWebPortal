package footwearwebportal;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.KeySpec;

class Crypto {
	private static Crypto instance;
	private static final String cipher = "DESede";

	private static SecretKey ky = null;
	private static Cipher c = null;

	private Crypto() throws Exception {
		String key = "b70a 25fb c9d8 6a86 050c e0d7 11ea d4d9"; // hard coded key gg
		byte[] enc = key.getBytes(StandardCharsets.UTF_8);
		KeySpec ks = new DESedeKeySpec(enc);
		SecretKeyFactory kf = SecretKeyFactory.getInstance(cipher);
		ky = kf.generateSecret(ks);
		c = Cipher.getInstance(cipher);
	}

	// SHA-256 hashing
	static String hashSHA256(String string) {
		MessageDigest digest;
		byte[] encodedHash = new byte[0];
		try {
			digest = MessageDigest.getInstance("SHA-256");
			encodedHash = digest.digest(string.getBytes(StandardCharsets.UTF_8));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		StringBuilder hexString = new StringBuilder();
		for (byte hash : encodedHash) {
			String hex = Integer.toHexString(0xff & hash);
			if (hex.length() == 1)
				hexString.append('0');
			hexString.append(hex);
		}

		return hexString.toString();
	}

	// instantiate crypto if doesn't exist and return it
	static Crypto getInstance() {
		if (instance == null) {
			try {
				instance = new Crypto();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return instance;
	}

	// takes unencoded string and returns encoded string
	String encrypt(String str) throws Exception {
		c.init(Cipher.ENCRYPT_MODE, ky);
		byte[] utf8 = str.getBytes(StandardCharsets.UTF_8);
		byte[] enc1 = c.doFinal(utf8);
		BASE64Encoder encoder = new BASE64Encoder();
		return encoder.encode(enc1);
	}

	// takes encoded string and returns decoded string
	String decrypt(String str) throws Exception {
		BASE64Decoder decoder = new BASE64Decoder();
		byte[] enc3 = decoder.decodeBuffer(str);
		c.init(Cipher.DECRYPT_MODE, ky);
		return new String(c.doFinal(enc3), StandardCharsets.UTF_8);
	}
}
