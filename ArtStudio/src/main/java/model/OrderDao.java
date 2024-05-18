package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;


public class OrderDao {
	private static Connection connection=CreateConnection.createConnection();
	private static int customerId=0;
	public static int orderTable(OrderDto dto) {
		String orderQuery="insert into orders values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt=connection.prepareStatement(orderQuery);
			pstmt.setInt(1, 0);
			pstmt.setString(2, dto.getOrderSketchType());
			pstmt.setString(3, dto.getOrderNoOfFaces());
			pstmt.setString(4, dto.getCustomerName());
			pstmt.setString(5, dto.getCustomerEmail());
			pstmt.setString(6, dto.getCustomerContact());
			pstmt.setString(7, dto.getCustomerAddress());
			pstmt.setString(8, dto.getPortraitSize());
			pstmt.setDouble(9, dto.getPortraitPrice());
			pstmt.setBlob(10,dto.getInputStream());
			pstmt.setInt(11, customerId);
			int count=pstmt.executeUpdate();
			
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	
	private static void getOrderId(CheckoutDto cDto) {
		String getCustomerDetail="select customer_id from bill where card_owner_name=?";
		try {
			PreparedStatement pstmt=connection.prepareStatement(getCustomerDetail);
			pstmt.setString(1, cDto.getCardOwnerName());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				customerId=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public static int checkoutTable(CheckoutDto cDto) {
		String checkoutQuery="insert into bill values(?,?,?,?,?)";
		try {
			Date date = Date.valueOf(LocalDate.now()); 
			PreparedStatement pstmt=connection.prepareStatement(checkoutQuery);
			pstmt.setInt(1, 0);
			pstmt.setString(2, cDto.getCardOwnerName());
			pstmt.setString(3, cDto.getCardNumber());
			pstmt.setDate(4, date);
			pstmt.setString(5, cDto.getPaymentInvoiceNumber());
			
			int count = pstmt.executeUpdate();
			getOrderId(cDto);
			return count;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public static OrderDto invoiceOrder(){
		String fetchCheckouttable="SELECT * FROM orders JOIN bill ON customer_ref=customer_id";
		OrderDto oDto=new OrderDto();
		try {
			Statement stmt=connection.createStatement();
			ResultSet rs=stmt.executeQuery(fetchCheckouttable);
			while(rs.next()) {
				oDto.setOrderSketchType(rs.getString(2));
				oDto.setCustomerName(rs.getString(4));
				oDto.setCustomerEmail(rs.getString(5));
				oDto.setCustomerAddress(rs.getString(7));
				oDto.setPortraitPrice(rs.getDouble(9));
			}
			return oDto;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return null;
	}
	public static CheckoutDto invoiceBill(){
		String fetchCheckouttable="SELECT * FROM orders JOIN bill ON customer_ref=customer_id";
		CheckoutDto cDto=new CheckoutDto();
		try {
			Statement stmt=connection.createStatement();
			ResultSet rs=stmt.executeQuery(fetchCheckouttable);
			while(rs.next()) {
				cDto.setCardOwnerName(rs.getString(13));
				cDto.setDate(rs.getDate(15));
				cDto.setPaymentInvoiceNumber(rs.getString(16));
			}
			return cDto;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return null;
	}
}
