package voting;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

public class CandidateBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String candidateName;
	private String candidateImage;
	private String candidateProfile;
	private String candidateAddress;
	private String candidatePosition;

	public CandidateBean(String name, String image, String profile, String address, String position) {
		this.candidateName = name;
		this.candidateAddress = address;
		this.candidateImage = image;
		this.candidateProfile = profile;
		this.candidateProfile = position;
		System.out.println("Consonstructor..........");
	}

	public String getCandidateAddress() {
		return candidateAddress;
	}

	public void setCandidateAddress(String candidateAddress) {
		this.candidateAddress = candidateAddress;
	}

	public String getCandidateProfile() {
		return candidateProfile;
	}

	public void setCandidateProfile(String candidateProfile) {
		this.candidateProfile = candidateProfile;
	}

	public String getCandidateImage() {
		return candidateImage;
	}

	public void setCandidateImage(String candidateImage) {
		this.candidateImage = candidateImage;
	}

	public String getCandidateName() {
		return candidateName;
	}

	public void setCandidateName(String candidateName) {
		this.candidateName = candidateName;
	}

	public String getCandidatePosition() {
		return candidatePosition;
	}

	public void setCandidatePosition(String candidatePosition) {
		this.candidatePosition = candidatePosition;
	}

}
