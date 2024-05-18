package model;

public class FeedbackDto {
	private int feedbackId;
	private String feedbackerName;
	private String feedbackerEmail;
	private String feedbackMessage;
	public int getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}
	public String getFeedbackerName() {
		return feedbackerName;
	}
	public void setFeedbackerName(String feedbackerName) {
		this.feedbackerName = feedbackerName;
	}
	public String getFeedbackMessage() {
		return feedbackMessage;
	}
	public void setFeedbackMessage(String feedbackMessage) {
		this.feedbackMessage = feedbackMessage;
	}
	public String getFeedbackerEmail() {
		return feedbackerEmail;
	}
	public void setFeedbackerEmail(String feedbackerEmail) {
		this.feedbackerEmail = feedbackerEmail;
	}
	
	
}
