package com.placementTest;

import com.placement.GeneratePlacementReportServlet;
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

public class GeneratePlacementReportServletTest {

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
    @Mock
    private RequestDispatcher dispatcher;

    private GeneratePlacementReportServlet servlet;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        servlet = new GeneratePlacementReportServlet();

        when(request.getSession(false)).thenReturn(session);
        when(session.getAttribute("coordinator_username")).thenReturn("coordinatorUser");

        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
        when(preparedStatement.executeQuery()).thenReturn(resultSet);
        when(resultSet.next()).thenReturn(true).thenReturn(true).thenReturn(true);
        when(resultSet.getInt(anyString())).thenReturn(10); 
        when(request.getRequestDispatcher("/placement_report.jsp")).thenReturn(dispatcher);
    }

    @Test
    public void testSuccessfulReportGeneration() throws Exception {
        servlet.doGet(request, response);

        verify(request).setAttribute(eq("reportData"), anyMap());
        verify(dispatcher).forward(request, response);
    }
    @Test
    public void testCoordinatorNotLoggedIn() throws Exception {
        when(request.getSession(false)).thenReturn(null);

        servlet.doGet(request, response);
        verify(response).sendRedirect("coordinator_login.jsp");
    }
}
