
<%@ page import="sctea.Competence" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Competence</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Competence List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Competence</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Competence</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${competenceInstance}">
            <div class="errors">
                <g:renderErrors bean="${competenceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${competenceInstance?.id}" />
                <input type="hidden" name="version" value="${competenceInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="domaine">Domaine:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:competenceInstance,field:'domaine','errors')}">
                                    <g:select optionKey="id" from="${sctea.Domaine.list()}" name="domaine.id" value="${competenceInstance?.domaine?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nomCompetence">Nom Competence:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:competenceInstance,field:'nomCompetence','errors')}">
                                    <input type="text" id="nomCompetence" name="nomCompetence" value="${fieldValue(bean:competenceInstance,field:'nomCompetence')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
