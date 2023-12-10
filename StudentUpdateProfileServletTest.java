package com.placementTest;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.placement.StudentUpdateProfileServlet;

import static org.mockito.Mockito.*;

public class StudentUpdateProfileServletTest {

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
    private RequestDispatcher dispatcher;

    private StudentUpdateProfileServlet servlet;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
        servlet = new StudentUpdateProfileServlet() {
            @Override
            protected Connection getConnection() {
                return connection;
            }
        };

        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
    }
    @Test
    public void testDoPostSuccessfulUpdate() throws Exception {
        when(request.getSession(false)).thenReturn(session);
        when(session.getAttribute("student_username")).thenReturn("testuser");
        when(request.getParameter("student_email")).thenReturn("test@example.com");
        when(request.getParameter("student_fullname")).thenReturn("Test User");
        when(request.getParameter("student_academic_year")).thenReturn("2");
        when(request.getParameter("student_major")).thenReturn("Computer Science");

        when(preparedStatement.executeUpdate()).thenReturn(1);

        servlet.doPost(request, response);

        verify(response).sendRedirect("student_view_profile.jsp");
    }
    @Test
    public void testDoPostNoSession() throws Exception {
        when(request.getSession(false)).thenReturn(null);

        servlet.doPost(request, response);

        verify(response).sendRedirect("student_signin.jsp");
    }
    

}

