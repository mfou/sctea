
<%@ page import="sctea.Periode" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Periode List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Periode</g:link></span>
        </div>
        <div class="body">
            <h1>Periode List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="periode" title="Periode" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${periodeInstanceList}" status="i" var="periodeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${periodeInstance.id}">${fieldValue(bean:periodeInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:periodeInstance, field:'periode')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${periodeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
