
<%@ page import="sctea.Ecole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Ecole</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Ecole List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Ecole</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ecoleInstance}">
            <div class="errors">
                <g:renderErrors bean="${ecoleInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:ecoleInstance,field:'nom','errors')}">
                                    <input type="text" id="nom" name="nom" value="${fieldValue(bean:ecoleInstance,field:'nom')}"/>
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
