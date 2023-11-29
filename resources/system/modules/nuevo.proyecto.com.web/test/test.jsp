<%@ page import="org.apache.commons.logging.Log" %>
<%@ page import="org.opencms.file.CmsObject" %>
<%@ page import="org.opencms.jsp.util.CmsJspStandardContextBean" %>
<%@ page import="org.opencms.main.CmsException" %>
<%@ page import="org.opencms.main.CmsLog" %>
<%@ page import="org.opencms.main.CmsSystemInfo" %>
<%@ page import="org.opencms.main.OpenCms" %>
<%@ page import="org.opencms.workplace.CmsWorkplaceAction" %>

<%@page buffer="none" session="false" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>

<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%!
    /*
     * Creada por: ChemaJiménez
     * Con fecha: 22/11/2023 - 13:29
     * Para el proyecto: com.saga.proyecto.base
     * Arrastra esta JSP a cualquier carpeta de OpenCms, haz clic con el botón derecho y clica en Display
     */
%>
<%!
    private static Log LOG = CmsLog.getLog("com.saga.proyecto.base.jsp.test");
    private static CmsObject cmsObjectAdmin = null;
    private static CmsObject cmsObjectActual = null;
    private static ServletOutputStream out = null;

    /**
     * Inicializa las variables globales a la JSP
     * @param request Petición
     */
    private void init(PageContext pageContext, HttpServletRequest request, HttpServletResponse response) {
        try {
            out = response.getOutputStream();
        } catch (Exception e) {
            LOG.error("No se ha inicializado correctamente el objeto out (ServletOutputStream)");
        }
        try {
            cmsObjectAdmin = CmsWorkplaceAction.getInstance().getCmsAdminObject();
        } catch (CmsException e) {
        }
        cmsObjectActual = CmsJspStandardContextBean.getInstance(request).getVfs().getCmsObject();
    }
%>
<%
    init(pageContext, request, response);
    CmsSystemInfo systemInfo = OpenCms.getSystemInfo();
    pageContext.setAttribute("serverName", systemInfo.getServerName());
    pageContext.setAttribute("isOnline", cmsObjectActual.getRequestContext().getCurrentProject().isOnlineProject());
    pageContext.setAttribute("usuario", cmsObjectActual.getRequestContext().getCurrentUser().getName());
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP de Ejemplo a Ejecutar en OpenCms 10.5.4</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        header {
            text-align: center;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
        }

        h1 {
            color: #333;
        }

        p {
            line-height: 1.6;
        }
    </style>
</head>
<body>
<header>
    <h1>JSP de Ejemplo a Ejecutar en OpenCms 10.5.4</h1>
</header>

<section>
    <h2>Información de OpenCms</h2>
    <ul>
        <li>Nombre del Servidor OpenCms: ${serverName}</li>
        <li>Estamos online: ${isOnline}</li>
        <li>Usuario: ${usuario}</li>
    </ul>
</section>

<footer>
    <p>&copy; JSP de Ejemplo a Ejecutar en OpenCms 10.5.4</p>
</footer>
</body>
</html>
