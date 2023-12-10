package com.placementTest;

import static org.junit.jupiter.api.Assertions.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.placement.StudentSigninServlet;

import static org.mockito.Mockito.*;

public class StudentSigninServletTest {

    @Mock
    private HttpServletRequest request;
    @Mock
    private HttpServletResponse response;
    @Mock
    private HttpSession session;
    @Mock
    private ServletConfig servletConfig;
    @Mock
    private ServletContext servletContext;
    @Mock
    private Connection connection;
    @Mock
    private PreparedStatement preparedStatement;
    @Mock
    private ResultSet resultSet;
    @Mock
    private RequestDispatcher dispatcher;

    private StudentSigninServlet servlet;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
        servlet = new StudentSigninServlet();
        
        when(servletConfig.getServletContext()).thenReturn(servletContext);
        servlet.init(servletConfig); 

        when(request.getSession()).thenReturn(session);
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeQuery()).thenReturn(resultSet);
        when(request.getRequestDispatcher("/student_signin.jsp")).thenReturn(dispatcher);
        when(request.getRequestDispatcher("/error.jsp")).thenReturn(dispatcher);
    }    @Test
    public void testDoPostSuccessfulLogin() throws Exception {
        when(request.getParameter("student_username")).thenReturn("testuser");
        when(request.getParameter("student_password")).thenReturn("password");

        when(resultSet.next()).thenReturn(true); 

        servlet.doPost(request, response);

        verify(session).setAttribute("student_username", "testuser");
        verify(response).sendRedirect("student_dashboard.jsp");
    }
    
    

}

