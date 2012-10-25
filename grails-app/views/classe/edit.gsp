
<%@ page import="sctea.Classe" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Classe</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Classe List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Classe</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Classe</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${classeInstance}">
            <div class="errors">
                <g:renderErrors bean="${classeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${classeInstance?.id}" />
                <input type="hidden" name="version" value="${classeInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ecole">Ecole:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:classeInstance,field:'ecole','errors')}">
                                    <g:select optionKey="id" from="${sctea.Ecole.list()}" name="ecole.id" value="${classeInstance?.ecole?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="niveau">Niveau:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:classeInstance,field:'niveau','errors')}">
                                    <input type="text" id="niveau" name="niveau" value="${fieldValue(bean:classeInstance,field:'niveau')}"/>
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
