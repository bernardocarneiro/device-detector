/*
 * Copyright (c) 2011 ScientiaMobile Inc.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * Refer to the COPYING file distributed with this package.
 */
package com.scientiamobile.example;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sourceforge.wurfl.core.Device;
import net.sourceforge.wurfl.core.GeneralWURFLEngine;
import net.sourceforge.wurfl.core.MarkUp;
import net.sourceforge.wurfl.core.WURFLHolder;
import net.sourceforge.wurfl.core.WURFLManager;
import net.sourceforge.wurfl.core.exc.CapabilityNotDefinedException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * 
 * 
 * @version $Id: HelloWorld.java 645 2011-05-14 22:35:37Z ermanno.franco $
 */
public class HelloWorld extends HttpServlet {

	/** Serial */
	private static final long serialVersionUID = 10L;

	private static final String XHTML_ADV = "xhtmladv.jsp";
	private static final String XHTML_SIMPLE = "xhtmlmp.jsp";
	private static final String CHTML = "chtml.jsp";
	private static final String WML = "wml.jsp";

	/** Logger */
	private final Logger log = LoggerFactory.getLogger(getClass());

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 * 
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 */
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
        GeneralWURFLEngine holder = (GeneralWURFLEngine)wac.getBean("WurflHolder");
        
        Device device = holder.getDeviceForRequest(request);
		
		log.debug("Device: " + device.getId());
		log.debug("Capability(preferred_markup): " + device.getCapability("preferred_markup"));
        log.debug("Capability(xhtml_can_embed_video): " + device.getCapability("xhtml_can_embed_video"));

		MarkUp markUp = device.getMarkUp();

		String jspView = null;

		if (MarkUp.XHTML_ADVANCED.equals(markUp)) {
			jspView = XHTML_ADV;
		} else if (MarkUp.XHTML_SIMPLE.equals(markUp)) {
			jspView = XHTML_SIMPLE;
		} else if (MarkUp.CHTML.equals(markUp)) {
			jspView = CHTML;
		} else if (MarkUp.WML.equals(markUp)) {
			jspView = WML;
		}

		log.info("View: " + jspView);

		// MIME type is decided by JSP. Only in case of XHTML we will need to
		// multi-serve
		// i.e text/html vs application/xml+xhtml vs
		// application/vnd.wap.xml+xhtml
		if (markUp == MarkUp.XHTML_ADVANCED || markUp == MarkUp.XHTML_SIMPLE) {
			String contentType = "text/html";
			try {
				contentType = device.getCapability("xhtmlmp_preferred_mime_type");
			} catch (CapabilityNotDefinedException e) {
				throw new RuntimeException("Something is seriously wrong with your WURFL:" + e.getLocalizedMessage(), e);
			}

			request.setAttribute("contentType", contentType);
			log.debug("ContentType: " + contentType);
		}

		request.setAttribute("markUp", markUp);
		request.setAttribute("device", device);

		request.getRequestDispatcher("WEB-INF/jsp/" + jspView).forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
