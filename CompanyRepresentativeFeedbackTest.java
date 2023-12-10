package com.placementTest;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.placement.CompanyRepresentativeFeedback;

import static org.mockito.Mockito.*;

public class CompanyRepresentativeFeedbackTest {

    @Mock
    private HttpServletRequest request;
    @Mock
    private HttpServletResponse response;
    @Mock
    private Connection connection;
    @Mock
    private PreparedStatement preparedStatement;

    private CompanyRepresentativeFeedback servlet;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
        servlet = new CompanyRepresentativeFeedback() {
            @Override
            protected Connection getConnection() {
                return connection;
            }
        };
        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
    }
    @Test
    public void testDoPostSuccessfulFeedbackSubmission() throws Exception {
        when(request.getParameter("representative_username")).thenReturn("repUser");
        when(request.getParameter("feedback_text")).thenReturn("Great job!");

        when(preparedStatement.executeUpdate()).thenReturn(1); 

        servlet.doPost(request, response);

        verify(response).sendRedirect("representative_dashboard.jsp");
    }
    @Test
    public void testDoPostMissingParameters() throws Exception {
        when(request.getParameter("representative_username")).thenReturn("");
        when(request.getParameter("feedback_text")).thenReturn("");

        servlet.doPost(request, response);

        verify(response).sendRedirect("error.jsp");
    }
    

}
