package sctea

import grails.converters.*

class EleveController {
    
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        withFormat {
            html { [ eleveInstanceList: Eleve.list( params ), eleveInstanceTotal: Eleve.count() ] }
            xml { render Eleve.list( params ) as XML  }
            json { render Eleve.list( params ) as JSON  }
        }
    }

    def show = {
        withFormat{
            html {
                def eleveInstance = Eleve.get( params.id )

                if(!eleveInstance) {
                    flash.message = "Eleve not found with id ${params.id}"
                    redirect(action:list)
                }
                else { return [ eleveInstance : eleveInstance ] } }
            xml { render  Eleve.get( params.id ) as XML }
            json { render  Eleve.get( params.id ) as JSON }
        }
    }

    def delete = {
        def eleveInstance = Eleve.get( params.id )
        if(eleveInstance) {
            eleveInstance.delete()
            flash.message = "Eleve ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Eleve not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def eleveInstance = Eleve.get( params.id )

        if(!eleveInstance) {
            flash.message = "Eleve not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ eleveInstance : eleveInstance ]
        }
    }

    def update = {
        def eleveInstance = Eleve.get( params.id )
        if(eleveInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(eleveInstance.version > version) {
                    
                    eleveInstance.errors.rejectValue("version", "eleve.optimistic.locking.failure", "Another user has updated this Eleve while you were editing.")
                    render(view:'edit',model:[eleveInstance:eleveInstance])
                    return
                }
            }
            eleveInstance.properties = params
            if(!eleveInstance.hasErrors() && eleveInstance.save()) {
                flash.message = "Eleve ${params.id} updated"
                redirect(action:show,id:eleveInstance.id)
            }
            else {
                render(view:'edit',model:[eleveInstance:eleveInstance])
            }
        }
        else {
            flash.message = "Eleve not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def eleveInstance = new Eleve()
        eleveInstance.properties = params
        return ['eleveInstance':eleveInstance]
    }

    def save = {
        def eleveInstance = new Eleve(params)
        if(!eleveInstance.hasErrors() && eleveInstance.save()) {
            flash.message = "Eleve ${eleveInstance.id} created"
            redirect(action:show,id:eleveInstance.id)
        }
        else {
            render(view:'create',model:[eleveInstance:eleveInstance])
        }
    }
}
