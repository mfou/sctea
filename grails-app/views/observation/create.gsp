
<%@ page import="sctea.Observation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Observation</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Observation List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Observation</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${observationInstance}">
            <div class="errors">
                <g:renderErrors bean="${observationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="eleve">Eleve:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:observationInstance,field:'eleve','errors')}">
                                    <g:select optionKey="id" from="${sctea.Eleve.list()}" name="eleve.id" value="${observationInstance?.eleve?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="observation">Observation:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:observationInstance,field:'observation','errors')}">
                                    <input type="text" id="observation" name="observation" value="${fieldValue(bean:observationInstance,field:'observation')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rapport">Rapport:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:observationInstance,field:'rapport','errors')}">
                                    <g:select optionKey="id" from="${sctea.Rapport.list()}" name="rapport.id" value="${observationInstance?.rapport?.id}" ></g:select>
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
