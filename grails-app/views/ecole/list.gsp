
<%@ page import="sctea.Ecole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Ecole List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Ecole</g:link></span>
        </div>
        <div class="body">
            <h1>Ecole List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="nom" title="Nom" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ecoleInstanceList}" status="i" var="ecoleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ecoleInstance.id}">${fieldValue(bean:ecoleInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:ecoleInstance, field:'nom')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ecoleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
