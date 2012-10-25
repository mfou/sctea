
<%@ page import="sctea.Domaine" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Domaine List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Domaine</g:link></span>
        </div>
        <div class="body">
            <h1>Domaine List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="nomDomaine" title="Nom Domaine" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${domaineInstanceList}" status="i" var="domaineInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${domaineInstance.id}">${fieldValue(bean:domaineInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:domaineInstance, field:'nomDomaine')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${domaineInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
