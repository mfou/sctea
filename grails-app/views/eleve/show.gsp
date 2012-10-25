
<%@ page import="sctea.Eleve" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Eleve</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Eleve List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Eleve</g:link></span>
        </div>
        <div class="body">
            <h1>Show Eleve</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:eleveInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Nom:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:eleveInstance, field:'nom')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Prenom:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:eleveInstance, field:'prenom')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${eleveInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
