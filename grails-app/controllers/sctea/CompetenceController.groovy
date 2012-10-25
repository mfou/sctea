
package sctea

import grails.converters.*

class CompetenceController {
    
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        withFormat {
            html { [ competenceInstanceList: Competence.list( params ), competenceInstanceTotal: Competence.count() ] }
            xml { render Competence.list( params ) as XML  }
            json { render Competence.list( params ) as JSON  }
        }
    }

    def show = {
        withFormat{
            html {
                def competenceInstance = Competence.get( params.id )

                if(!competenceInstance) {
                    flash.message = "Competence not found with id ${params.id}"
                    redirect(action:list)
                }
                else { return [ competenceInstance : competenceInstance ] } }
            xml { render  Competence.get( params.id ) as XML }
            json { render  Competence.get( params.id ) as JSON }
        }
    }

    def delete = {
        def competenceInstance = Competence.get( params.id )
        if(competenceInstance) {
            competenceInstance.delete()
            flash.message = "Competence ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Competence not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def competenceInstance = Competence.get( params.id )

        if(!competenceInstance) {
            flash.message = "Competence not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ competenceInstance : competenceInstance ]
        }
    }

    def update = {
        def competenceInstance = Competence.get( params.id )
        if(competenceInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(competenceInstance.version > version) {
                    
                    competenceInstance.errors.rejectValue("version", "competence.optimistic.locking.failure", "Another user has updated this Competence while you were editing.")
                    render(view:'edit',model:[competenceInstance:competenceInstance])
                    return
                }
            }
            competenceInstance.properties = params
            if(!competenceInstance.hasErrors() && competenceInstance.save()) {
                flash.message = "Competence ${params.id} updated"
                redirect(action:show,id:competenceInstance.id)
            }
            else {
                render(view:'edit',model:[competenceInstance:competenceInstance])
            }
        }
        else {
            flash.message = "Competence not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def competenceInstance = new Competence()
        competenceInstance.properties = params
        return ['competenceInstance':competenceInstance]
    }

    def save = {
        def competenceInstance = new Competence(params)
        if(!competenceInstance.hasErrors() && competenceInstance.save()) {
            flash.message = "Competence ${competenceInstance.id} created"
            redirect(action:show,id:competenceInstance.id)
        }
        else {
            render(view:'create',model:[competenceInstance:competenceInstance])
        }
    }
}
