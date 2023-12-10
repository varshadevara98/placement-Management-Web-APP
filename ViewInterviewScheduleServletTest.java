package com.placementTest;

import com.placement.ViewInterviewScheduleServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static org.mockito.Mockito.*;

public class ViewInterviewScheduleServletTest {

    @Mock
    private HttpServletRequest request;
    @Mock
    private HttpServletResponse response;
    @Mock
    private HttpSession session;
    @Mock
    private RequestDispatcher dispatcher;
    @Mock
    private Connection connection;
    @Mock
    private PreparedStatement preparedStatement;
    @Mock
    private ResultSet resultSet;

    private ViewInterviewScheduleServlet servlet;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        servlet = new ViewInterviewScheduleServlet();
        when(request.getSession(false)).thenReturn(session);
        when(session.getAttribute("student_username")).thenReturn("studentUser");
        when(request.getRequestDispatcher("/view_interview_schedule.jsp")).thenReturn(dispatcher);

        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeQuery()).thenReturn(resultSet);
        when(resultSet.next()).thenReturn(true).thenReturn(false);
    }

    @Test
    public void testSuccessfulRetrieval() throws Exception {
        servlet.doGet(request, response);

        verify(request).setAttribute(eq("interviewSchedules"), anyList());
        verify(dispatcher).forward(request, response);
    }
}
