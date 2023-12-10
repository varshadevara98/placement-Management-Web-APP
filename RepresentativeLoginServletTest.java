package com.placementTest;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.placement.RepresentativeLoginServlet;

import static org.mockito.Mockito.*;

public class RepresentativeLoginServletTest {

    @Mock
    private HttpServletRequest request;
    @Mock
    private HttpServletResponse response;
    @Mock
    private HttpSession session;
    @Mock
    private Connection connection;
    @Mock
    private PreparedStatement preparedStatement;
    @Mock
    private ResultSet resultSet;

    private RepresentativeLoginServlet servlet;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
        servlet = new RepresentativeLoginServlet() {
            @Override
            protected Connection getConnection() {
                return connection;
            }
        };

        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeQuery()).thenReturn(resultSet);
        when(request.getSession()).thenReturn(session);
    }
    
    @Test
    public void testDoPostInvalidCredentials() throws Exception {
        when(request.getParameter("compusername")).thenReturn("wronguser");
        when(request.getParameter("comppassword")).thenReturn("wrongpass");

        when(resultSet.next()).thenReturn(false); 

        servlet.doPost(request, response);

        verify(response).sendRedirect("comp_representative_login.jsp?error=invalid");
    }
    

}

