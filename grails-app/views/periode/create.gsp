
<%@ page import="sctea.Periode" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Periode</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Periode List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Periode</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${periodeInstance}">
            <div class="errors">
                <g:renderErrors bean="${periodeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="periode">Periode:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:periodeInstance,field:'periode','errors')}">
                                    <input type="text" id="periode" name="periode" value="${fieldValue(bean:periodeInstance,field:'periode')}"/>
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
