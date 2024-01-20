package loginportal;

import java.util.HashMap;
import java.util.Map;

public class User {
	public static Map<String, Integer> items = new HashMap<String, Integer>();
	public static void setItem(String item) {
		if(items.get(item) == null) {
			items.put(item, 1);
		}
		else {
			items.put(item, items.get(item)+1);
		}
	}
}
