package cn.edu.cqupt.util;

import org.springframework.security.web.authentication.logout.LogoutFilter;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

public class UserLogoutFilter extends LogoutFilter {

    public UserLogoutFilter(String logoutSuccessUrl, LogoutHandler... handlers) {
        super(logoutSuccessUrl, handlers);
        logger.debug("CustomLogoutFilter(String, LogoutHandler[]) - start"); //$NON-NLS-1$

        logger.debug("CustomLogoutFilter(String, LogoutHandler[]) - end"); //$NON-NLS-1$
    }

    public UserLogoutFilter(LogoutSuccessHandler logoutSuccessHandler, LogoutHandler... handlers) {
        super(logoutSuccessHandler, handlers);
        logger.debug("CustomLogoutFilter(LogoutSuccessHandler, LogoutHandler[]) - start"); //$NON-NLS-1$

        logger.debug("CustomLogoutFilter(LogoutSuccessHandler, LogoutHandler[]) - end"); //$NON-NLS-1$
    }
}
