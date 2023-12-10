package com.placementTest;

import com.placement.ScheduleInterviewServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.sql.Connection;
import java.sql.PreparedStatement;

import static org.mockito.Mockito.*;

public class ScheduleInterviewServletTest {

    @Mock
    private HttpServletRequest request;
    @Mock
    private HttpServletResponse response;
    @Mock
    private Connection connection;
    @Mock
    private PreparedStatement preparedStatement;

    private ScheduleInterviewServlet servlet;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        servlet = new ScheduleInterviewServlet();

        when(request.getParameter("student_username")).thenReturn("studentUser");
        when(request.getParameter("profile_id")).thenReturn("1");
        when(request.getParameter("interview_date")).thenReturn("2023-01-01");
        when(request.getParameter("interview_time")).thenReturn("10:00");

        // Mock the database connection and prepared statement
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeUpdate()).thenReturn(1); // Simulate successful insertion
    }

    @Test
    public void testSuccessfulInterviewScheduling() throws Exception {
        servlet.doPost(request, response);

        verify(preparedStatement).setString(1, "studentUser");
        verify(preparedStatement).setInt(2, 1);
        verify(preparedStatement).setDate(3, java.sql.Date.valueOf("2023-01-01"));
        verify(preparedStatement).setTime(4, java.sql.Time.valueOf("10:00:00"));
        verify(preparedStatement).executeUpdate();
        verify(response).sendRedirect("coordinator_success.jsp");
    }
}
