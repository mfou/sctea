
<%@ page import="sctea.Evaluation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Evaluation List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Evaluation</g:link></span>
        </div>
        <div class="body">
            <h1>Evaluation List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Competence</th>
                   	    
                   	        <th>Eleve</th>
                   	    
                   	        <th>Periode</th>
                   	    
                   	        <th>Rapport</th>
                   	    
                   	        <g:sortableColumn property="valeur" title="Valeur" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${evaluationInstanceList}" status="i" var="evaluationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${evaluationInstance.id}">${fieldValue(bean:evaluationInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:evaluationInstance, field:'competence')}</td>
                        
                            <td>${fieldValue(bean:evaluationInstance, field:'eleve')}</td>
                        
                            <td>${fieldValue(bean:evaluationInstance, field:'periode')}</td>
                        
                            <td>${fieldValue(bean:evaluationInstance, field:'rapport')}</td>
                        
                            <td>${fieldValue(bean:evaluationInstance, field:'valeur')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${evaluationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
