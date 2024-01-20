package loginportal;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryption {
	public static String encrypt(String pass) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] digest = md.digest(pass.getBytes());
		BigInteger a = new BigInteger(1, digest);
		return a.toString(20);
	}

	public static boolean check(String password) {
		String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,25}";
		if (!(password.isEmpty() || password.isBlank()))
			if (password.matches(pattern))
				return true;
		return false;
	}
}
