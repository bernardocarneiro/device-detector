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
<%-- $Id: xhtmlmp.jsp 902 2012-03-14 15:26:51Z fulvio.crivellaro $ --%>
<% response.setContentType((String)request.getAttribute("contentType"));%>
<%@page import="net.sourceforge.wurfl.core.Device"%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	
	<head>
	   <title>Hello World</title>
	</head>
	
	<body>
		<h1>Hello From XHTML SIMPLE</h1>
		<p>ContentType: <%=request.getAttribute("contentType") %></p>
		<p>Device: <%=((Device)request.getAttribute("device")).getId() %></p>
	 	<p><b>Virtual capabilities:</b></p>
		<p>Is smartphone: <%=((Device)request.getAttribute("device")).getVirtualCapability("is_smartphone") %></p>
       	<p>Is iPhone OS: <%=((Device)request.getAttribute("device")).getVirtualCapability("is_iphone_os") %></p>
       	<p>Is Android: <%=((Device)request.getAttribute("device")).getVirtualCapability("is_android") %></p>
       	<img src="images/logo.gif" width="59" height="76" alt="logo" />
	</body>
</html>