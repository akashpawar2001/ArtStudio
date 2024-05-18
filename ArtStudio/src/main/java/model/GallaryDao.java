package model;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class GallaryDao {
	private static Connection connection=CreateConnection.createConnection();
	public static List<GallaryDto> fetchImage(){
		ArrayList<GallaryDto> imgList=new ArrayList<>();
		GallaryDto img=null;
		String fetchImgData="select * from image";
		try {
			Statement stmt=connection.createStatement();
			ResultSet rs=stmt.executeQuery(fetchImgData);
			while(rs.next()) {
				img=new GallaryDto();
				img.setImgId(rs.getInt(1));
				img.setImgTitle(rs.getString(2));
				Blob blob = rs.getBlob(3);
				
				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                img.setBase64Image(base64Image);
				img.setImgDate(rs.getString(4));
				img.setImgType(rs.getString(5));
				imgList.add(img);
				inputStream.close();
				outputStream.close();
			}
			return imgList;
		} catch (SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
