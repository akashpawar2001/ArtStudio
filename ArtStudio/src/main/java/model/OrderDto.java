package model;

import java.io.InputStream;

public class OrderDto {
	//poster details
	private int orderId;
	private String orderSketchType;
	private String orderNoOfFaces;
	private String portraitSize;
	private double portraitPrice;
	private InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	//customer details
	private String customerName;
	private String customerEmail;
	private String customerContact;
	private String customerAddress;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getOrderSketchType() {
		return orderSketchType;
	}
	public void setOrderSketchType(String orderSketchType) {
		this.orderSketchType = orderSketchType;
	}
	public String getOrderNoOfFaces() {
		return orderNoOfFaces;
	}
	public void setOrderNoOfFaces(String orderNoOfFaces) {
		this.orderNoOfFaces = orderNoOfFaces;
	}
	public String getPortraitSize() {
		return portraitSize;
	}
	public void setPortraitSize(String portraitSize) {
		this.portraitSize = portraitSize;
	}
	public double getPortraitPrice() {
		return portraitPrice;
	}
	public void setPortraitPrice(double portraitPrice) {
		this.portraitPrice = portraitPrice;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	public String getCustomerContact() {
		return customerContact;
	}
	public void setCustomerContact(String customerContact) {
		this.customerContact = customerContact;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	
	
	
}
