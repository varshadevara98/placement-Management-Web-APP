package com.placementTest;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.placement.StudentFeedbackServlet;

import static org.mockito.Mockito.*;
import static org.mockito.ArgumentMatchers.*;

public class StudentFeedbackServletTest {

    @Mock
    private HttpServletRequest request;
    @Mock
    private HttpServletResponse response;
    @Mock
    private Connection connection;
    @Mock
    private PreparedStatement preparedStatement;

    private StudentFeedbackServlet servlet;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
        servlet = new StudentFeedbackServlet() {
            @Override
            protected Connection getConnection() {
                return connection;
            }
        };
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
    }
    @Test
    public void testDoPostSuccessfulFeedbackSubmission() throws Exception {
        when(request.getParameter("student_username")).thenReturn("testuser");
        when(request.getParameter("feedback_text")).thenReturn("Great course!");

        when(preparedStatement.executeUpdate()).thenReturn(1); 

        servlet.doPost(request, response);

        verify(response).sendRedirect("student_dashboard.jsp");
    }
    @Test
    public void testDoPostMissingParameters() throws Exception {
        when(request.getParameter("student_username")).thenReturn("");
        when(request.getParameter("feedback_text")).thenReturn("");

        servlet.doPost(request, response);

        verify(response).sendRedirect("error.jsp");
    }
  

    @Test
    public void testDoPostSQLException() throws Exception {
        when(request.getParameter("student_username")).thenReturn("testuser");
        when(request.getParameter("feedback_text")).thenReturn("Great course!");

        when(preparedStatement.executeUpdate()).thenThrow(new SQLException()); 

        servlet.doPost(request, response);

       
    }

}

