<%--

    Copyright (c) 2011 ScientiaMobile Inc.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    Refer to the COPYING file distributed with this package.

--%>
<?xml version="1.0"?>
<%--

    This file is released under the GNU General Public License.
    Refer to the COPYING file distributed with this package.

    Copyright (c) 2008-2009 WURFL-Pro srl

--%>
<%-- $Id: wml.jsp 902 2012-03-14 15:26:51Z fulvio.crivellaro $ --%>
<%@ page language="java" contentType="text/vnd.wap.wml" %>
<%@page import="net.sourceforge.wurfl.core.Device"%>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
    <card id="w" title="Hello World">
        <p>
            <img src="images/logo.wbmp" alt="Wurfl" /> 
            <br/>
            <br/><b>Hello From WML </b><br />
			<p>ContentType: <%=request.getAttribute("contentType") %></p>
			<p>Device: <%=((Device)request.getAttribute("device")).getId() %></p>
			<p><b>Virtual capabilities:</b></p>
			<p>Is smartphone: <%=((Device)request.getAttribute("device")).getVirtualCapability("is_smartphone") %></p>
	       	<p>Is iPhone OS: <%=((Device)request.getAttribute("device")).getVirtualCapability("is_iphone_os") %></p>
	       	<p>Is Android: <%=((Device)request.getAttribute("device")).getVirtualCapability("is_android") %></p>
        	<img src="images/logo.gif" width="59" height="76" alt="logo" />
        </p>
    </card>
</wml>