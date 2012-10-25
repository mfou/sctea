
<%@ page import="sctea.Domaine" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Domaine</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Domaine List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Domaine</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${domaineInstance}">
            <div class="errors">
                <g:renderErrors bean="${domaineInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nomDomaine">Nom Domaine:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:domaineInstance,field:'nomDomaine','errors')}">
                                    <input type="text" id="nomDomaine" name="nomDomaine" value="${fieldValue(bean:domaineInstance,field:'nomDomaine')}"/>
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
