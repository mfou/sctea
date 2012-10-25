
<%@ page import="sctea.Eleve" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Eleve List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Eleve</g:link></span>
        </div>
        <div class="body">
            <h1>Eleve List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="nom" title="Nom" />
                        
                   	        <g:sortableColumn property="prenom" title="Prenom" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${eleveInstanceList}" status="i" var="eleveInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${eleveInstance.id}">${fieldValue(bean:eleveInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:eleveInstance, field:'nom')}</td>
                        
                            <td>${fieldValue(bean:eleveInstance, field:'prenom')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${eleveInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
