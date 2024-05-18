package model;

import java.sql.Date;

public class CheckoutDto {
	private int customerId;
	private String cardOwnerName;
	private String cardNumber;
	private String paymentInvoiceNumber;
	private Date date;
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getPaymentInvoiceNumber() {
		return paymentInvoiceNumber;
	}
	public void setPaymentInvoiceNumber(String paymentInvoiceNumber) {
		this.paymentInvoiceNumber = paymentInvoiceNumber;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getCardOwnerName() {
		return cardOwnerName;
	}
	public void setCardOwnerName(String cardOwnerName) {
		this.cardOwnerName = cardOwnerName;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	
}
