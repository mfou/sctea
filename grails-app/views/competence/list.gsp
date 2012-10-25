
<%@ page import="sctea.Competence" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Competence List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Competence</g:link></span>
        </div>
        <div class="body">
            <h1>Competence List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Domaine</th>
                   	    
                   	        <g:sortableColumn property="nomCompetence" title="Nom Competence" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${competenceInstanceList}" status="i" var="competenceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${competenceInstance.id}">${fieldValue(bean:competenceInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:competenceInstance, field:'domaine')}</td>
                        
                            <td>${fieldValue(bean:competenceInstance, field:'nomCompetence')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${competenceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
