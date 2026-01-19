package com.tap.main;

import java.util.Scanner;

import com.tap.DAOimplementation.UserDAOImpl;
import com.tap.model.User;

public class launch {

	public static void main(String[] args) {
		Scanner scanner=new Scanner(System.in);
		
		System.out.println("Enter the username");
		String username=scanner.next();
		
		System.out.println("Enter the password");
		String password=scanner.next();
		
		System.out.println("Enter the email");
		String email=scanner.next();
		
		System.out.println("Enter the address");
		String address=scanner.next();
		
		System.out.println("Enter the role");
		String role=scanner.next();
		
		User u=new User(username, password, email, address, role);
		UserDAOImpl ud = new UserDAOImpl();
		ud.addUser(u);
		System.out.println("INSERTED");
	}
}