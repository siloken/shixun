package cn.edu.cqupt.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserLogoutHandler implements LogoutHandler {

    protected final Log logger = LogFactory.getLog(getClass());

    public UserLogoutHandler() {};

    @Override
    public void logout(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) {
        logger.debug("logout(HttpServletRequest, HttpServletResponse, Authentication) - start"); //$NON-NLS-1$

        logger.debug("logout(HttpServletRequest, HttpServletResponse, Authentication) - end"); //$NON-NLS-1$

    }
}
