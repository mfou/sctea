
<%@ page import="sctea.Classe" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Classe List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Classe</g:link></span>
        </div>
        <div class="body">
            <h1>Classe List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Ecole</th>
                   	    
                   	        <g:sortableColumn property="niveau" title="Niveau" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${classeInstanceList}" status="i" var="classeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${classeInstance.id}">${fieldValue(bean:classeInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:classeInstance, field:'ecole')}</td>
                        
                            <td>${fieldValue(bean:classeInstance, field:'niveau')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${classeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
