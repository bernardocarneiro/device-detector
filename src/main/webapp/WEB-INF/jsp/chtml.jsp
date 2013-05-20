<%--

    Copyright (c) 2011 ScientiaMobile Inc.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    Refer to the COPYING file distributed with this package.

--%>
<%-- $Id: chtml.jsp 902 2012-03-14 15:26:51Z fulvio.crivellaro $ --%>
<%@page import="net.sourceforge.wurfl.core.Device"%>
<html>
	<head>
	   <title>Hello World</title>
	</head>
	<body>
		<h1>Hello From CHTML</h1>
		<p>ContentType: <%=request.getAttribute("contentType") %></p>
		<p>Device: <%=((Device)request.getAttribute("device")).getId() %></p>
		<p><b>Virtual capabilities:</b></p>
		<p>Is smartphone: <%=((Device)request.getAttribute("device")).getVirtualCapability("is_smartphone") %></p>
       	<p>Is iPhone OS: <%=((Device)request.getAttribute("device")).getVirtualCapability("is_iphone_os") %></p>
       	<p>Is Android: <%=((Device)request.getAttribute("device")).getVirtualCapability("is_android") %></p>
	</body>
</html>