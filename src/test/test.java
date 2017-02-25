package test;





import java.sql.Timestamp;
import java.util.Date;

import org.junit.Test;

public class test {
	
	public static void main(String[] args) {
		System.out.println(new Date().getTime());
		Timestamp timestamp = new Timestamp(new Date().getTime());
		System.out.println(timestamp);
	}

}
