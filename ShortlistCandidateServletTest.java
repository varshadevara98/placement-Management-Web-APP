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

import com.placement.ShortlistCandidateServlet;

import static org.mockito.Mockito.*;

public class ShortlistCandidateServletTest {

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

    private ShortlistCandidateServlet servlet;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
        servlet = new ShortlistCandidateServlet() {
            @Override
            protected Connection getConnection() {
                return connection; 
            }
        };
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
    }
    @Test
    public void testDoPostSuccessfulShortlist() throws Exception {
        when(request.getParameter("application_id")).thenReturn("1");
        when(request.getParameter("application_status")).thenReturn("shortlisted");

        when(preparedStatement.executeUpdate()).thenReturn(1);

        servlet.doPost(request, response);

        verify(response).sendRedirect("representative_success.jsp");
    }
    @Test
    public void testDoPostNoRowsUpdated() throws Exception {
        when(request.getParameter("application_id")).thenReturn("2");
        when(request.getParameter("application_status")).thenReturn("shortlisted");

        when(preparedStatement.executeUpdate()).thenReturn(0);

        servlet.doPost(request, response);

        verify(response).sendRedirect("representative_error.jsp");
    }
   


}
