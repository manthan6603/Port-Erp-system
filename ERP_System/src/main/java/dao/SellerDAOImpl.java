package dao;

import jdbc.GetConnection;

import models.SellerPojo;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import daointerfaces.SellerDAO;

public class SellerDAOImpl implements SellerDAO {
	CallableStatement callableStatement = null;
    @Override
    public void registerSeller(SellerPojo sellerPojo)  {
        try  {
			try {
				callableStatement = GetConnection.connect().prepareCall("CALL RegisterSeller(?,?)");
	            callableStatement.setInt(1, sellerPojo.getPort_id());
	            callableStatement.setString(2, sellerPojo.getPassword());
	            callableStatement.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean loginSeller(SellerPojo sellerPojo) {
        boolean authStatus = false;
        ResultSet rs = null;

        try {
        	CallableStatement callableStatement;
			try {
				callableStatement = GetConnection.connect().prepareCall("CALL Login(?,?,?)");
	            callableStatement.setInt(1, sellerPojo.getPort_id());
	            callableStatement.setString(2, sellerPojo.getPassword());
	            callableStatement.setString(3, sellerPojo.getRole());
	            rs = callableStatement.executeQuery();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
			if (rs.next()) {
			    String loginStatus = rs.getString("login_status"); // Fetch the login status message
			    
			    // Determine success based on the returned message
			    if ("Login Successful".equals(loginStatus)) {
			        authStatus = true; // Login was successful
			    }
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return authStatus;
    }

   
    
  
   

	}

   

