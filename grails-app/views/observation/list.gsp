
<%@ page import="sctea.Observation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Observation List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Observation</g:link></span>
        </div>
        <div class="body">
            <h1>Observation List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Eleve</th>
                   	    
                   	        <g:sortableColumn property="observation" title="Observation" />
                        
                   	        <th>Rapport</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${observationInstanceList}" status="i" var="observationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${observationInstance.id}">${fieldValue(bean:observationInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:observationInstance, field:'eleve')}</td>
                        
                            <td>${fieldValue(bean:observationInstance, field:'observation')}</td>
                        
                            <td>${fieldValue(bean:observationInstance, field:'rapport')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${observationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
