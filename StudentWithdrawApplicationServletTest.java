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

import com.placement.StudentWithdrawApplicationServlet;

import static org.mockito.Mockito.*;

public class StudentWithdrawApplicationServletTest {

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

    private StudentWithdrawApplicationServlet servlet;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
        servlet = new StudentWithdrawApplicationServlet() {
            @Override
            protected Connection getConnection() {
                return connection;
            }
        };

        when(connection.prepareStatement(anyString())).thenReturn(preparedStatement);
    }
    

    @Test
    public void testDoPostNoSession() throws Exception {
        when(request.getSession(false)).thenReturn(null);

        servlet.doPost(request, response);

        verify(response).sendRedirect("student_signin.jsp");
    }
    
}
