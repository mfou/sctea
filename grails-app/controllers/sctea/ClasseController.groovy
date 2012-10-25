package sctea

import grails.converters.*

class ClasseController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        withFormat {
            html { [ classeInstanceList: Classe.list( params ), classeInstanceTotal: Classe.count() ] }
            xml { render Classe.list( params ) as XML  }
            json { render Classe.list( params ) as JSON  }
        }
    }

    def show = {
        withFormat{
            html {
                def classeInstance = Classe.get( params.id )

                if(!classeInstance) {
                    flash.message = "Classe not found with id ${params.id}"
                    redirect(action:list)
                }
                else { return [ classeInstance : classeInstance ] } }
            xml { render  Classe.get( params.id ) as XML }
            json { render  Classe.get( params.id ) as JSON }
        }
    }

    def delete = {
        def classeInstance = Classe.get( params.id )
        if(classeInstance) {
            classeInstance.delete()
            flash.message = "Classe ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Classe not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def classeInstance = Classe.get( params.id )

        if(!classeInstance) {
            flash.message = "Classe not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ classeInstance : classeInstance ]
        }
    }

    def update = {
        def classeInstance = Classe.get( params.id )
        if(classeInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(classeInstance.version > version) {
                    
                    classeInstance.errors.rejectValue("version", "classe.optimistic.locking.failure", "Another user has updated this Classe while you were editing.")
                    render(view:'edit',model:[classeInstance:classeInstance])
                    return
                }
            }
            classeInstance.properties = params
            if(!classeInstance.hasErrors() && classeInstance.save()) {
                flash.message = "Classe ${params.id} updated"
                redirect(action:show,id:classeInstance.id)
            }
            else {
                render(view:'edit',model:[classeInstance:classeInstance])
            }
        }
        else {
            flash.message = "Classe not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def classeInstance = new Classe()
        classeInstance.properties = params
        return ['classeInstance':classeInstance]
    }

    def save = {
        def classeInstance = new Classe(params)
        if(!classeInstance.hasErrors() && classeInstance.save()) {
            flash.message = "Classe ${classeInstance.id} created"
            redirect(action:show,id:classeInstance.id)
        }
        else {
            render(view:'create',model:[classeInstance:classeInstance])
        }
    }
}
