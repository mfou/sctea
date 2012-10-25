
<%@ page import="sctea.Rapport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Rapport List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Rapport</g:link></span>
        </div>
        <div class="body">
            <h1>Rapport List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Classe</th>
                   	    
                   	        <th>Eleve</th>
                   	    
                   	        <th>Evaluations</th>
                   	    
                   	        <th>Observations</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${rapportInstanceList}" status="i" var="rapportInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${rapportInstance.id}">${fieldValue(bean:rapportInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:rapportInstance, field:'classe')}</td>
                        
                            <td>${fieldValue(bean:rapportInstance, field:'eleve')}</td>
                        
                            <td>${fieldValue(bean:rapportInstance, field:'evaluations')}</td>
                        
                            <td>${fieldValue(bean:rapportInstance, field:'observations')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${rapportInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
