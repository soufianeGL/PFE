package org.glsid.entities;

public enum UserProfileType {
	USER("USER"), CPR("CPR"), ADMIN("ADMIN");

	String userProfileType;

	private UserProfileType(String userProfileType) {
		this.userProfileType = userProfileType;
	}

	public String getUserProfileType() {
		return userProfileType;
	}

}