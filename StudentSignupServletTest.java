package com.placementTest;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import org.junit.Before;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.placement.StudentSignupServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import static org.mockito.Mockito.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentSignupServletTest {

    @Mock
    private HttpServletRequest request;
    @Mock
    private HttpServletResponse response;
    @Mock
    private RequestDispatcher dispatcher;
    @Mock
    private Connection connection;
    @Mock
    private PreparedStatement preparedStatement;
    @Mock
    private ServletConfig servletConfig;
    @Mock
    private ServletContext servletContext;


    private StudentSignupServlet servlet;

    @BeforeEach
    public void setUp() throws SQLException, ClassNotFoundException, ServletException {
        MockitoAnnotations.initMocks(this);
        servlet = new StudentSignupServlet() {
            @Override
            protected Connection getConnection() {
                return connection;
            }
        };

   
        when(servletConfig.getServletContext()).thenReturn(servletContext);
        when(servletContext.getRequestDispatcher(anyString())).thenReturn(dispatcher);
        
        servlet.init(servletConfig); 

        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
    }


    @Test
    public void testDoPostSuccessfulSignup() throws Exception {
        when(request.getParameter("student_username")).thenReturn("testUser");
        when(request.getParameter("student_password")).thenReturn("testPass");
        when(request.getParameter("student_email")).thenReturn("test@example.com");
        when(request.getParameter("student_fullname")).thenReturn("Test FullName");
        when(request.getParameter("student_academic_year")).thenReturn("1");
        when(request.getParameter("student_major")).thenReturn("Computer Science");

        when(preparedStatement.executeUpdate()).thenReturn(1); 
        servlet.doPost(request, response);

        verify(response).sendRedirect("student_signin.jsp");
    }

    @Test
    public void testDoPostUsernameExists() throws Exception {
        when(request.getParameter("student_username")).thenReturn("existingUser");
        when(request.getParameter("student_password")).thenReturn("existingPass");
        when(request.getParameter("student_email")).thenReturn("existing@example.com");
        when(request.getParameter("student_fullname")).thenReturn("Existing FullName");
        when(request.getParameter("student_academic_year")).thenReturn("2");
        when(request.getParameter("student_major")).thenReturn("Engineering");

        SQLException sqlException = new SQLException("Username exists", "23000");
        when(preparedStatement.executeUpdate()).thenThrow(sqlException);

        when(request.getRequestDispatcher("/student_signup.jsp")).thenReturn(dispatcher);

        servlet.doPost(request, response);

        verify(request).setAttribute(eq("error"), anyString());
        verify(dispatcher).forward(request, response);
    }


    @Test
    public void testDoPostDatabaseError() throws Exception {
        when(request.getParameter("student_username")).thenReturn("testUser");
        when(request.getParameter("student_password")).thenReturn("testPass123");
        when(request.getParameter("student_email")).thenReturn("testuser@example.com");
        when(request.getParameter("student_fullname")).thenReturn("Test User");
        when(request.getParameter("student_academic_year")).thenReturn("1");
        when(request.getParameter("student_major")).thenReturn("Mathematics");

        when(preparedStatement.executeUpdate()).thenThrow(new SQLException());

        servlet.doPost(request, response);

      
    }

}