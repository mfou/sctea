
<%@ page import="sctea.Eleve" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Eleve</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Eleve List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Eleve</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${eleveInstance}">
            <div class="errors">
                <g:renderErrors bean="${eleveInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nom">Nom:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eleveInstance,field:'nom','errors')}">
                                    <input type="text" id="nom" name="nom" value="${fieldValue(bean:eleveInstance,field:'nom')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="prenom">Prenom:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:eleveInstance,field:'prenom','errors')}">
                                    <input type="text" id="prenom" name="prenom" value="${fieldValue(bean:eleveInstance,field:'prenom')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
