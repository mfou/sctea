package sctea

import grails.converters.*

class DomaineController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        withFormat {
            html { [ domaineInstanceList: Domaine.list( params ), domaineInstanceTotal: Domaine.count() ] }
            xml { render Domaine.list( params ) as XML  }
            json { render Domaine.list( params ) as JSON  }
        }
    }

    def show = {
        withFormat{
            html {
                def domaineInstance = Domaine.get( params.id )

                if(!domaineInstance) {
                    flash.message = "Domaine not found with id ${params.id}"
                    redirect(action:list)
                }
                else { return [ domaineInstance : domaineInstance ] } }
            xml { render  Domaine.get( params.id ) as XML }
            json { render  Domaine.get( params.id ) as JSON }
        }
    }

    def delete = {
        def domaineInstance = Domaine.get( params.id )
        if(domaineInstance) {
            domaineInstance.delete()
            flash.message = "Domaine ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Domaine not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def domaineInstance = Domaine.get( params.id )

        if(!domaineInstance) {
            flash.message = "Domaine not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ domaineInstance : domaineInstance ]
        }
    }

    def update = {
        def domaineInstance = Domaine.get( params.id )
        if(domaineInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(domaineInstance.version > version) {
                    
                    domaineInstance.errors.rejectValue("version", "domaine.optimistic.locking.failure", "Another user has updated this Domaine while you were editing.")
                    render(view:'edit',model:[domaineInstance:domaineInstance])
                    return
                }
            }
            domaineInstance.properties = params
            if(!domaineInstance.hasErrors() && domaineInstance.save()) {
                flash.message = "Domaine ${params.id} updated"
                redirect(action:show,id:domaineInstance.id)
            }
            else {
                render(view:'edit',model:[domaineInstance:domaineInstance])
            }
        }
        else {
            flash.message = "Domaine not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def domaineInstance = new Domaine()
        domaineInstance.properties = params
        return ['domaineInstance':domaineInstance]
    }

    def save = {
        def domaineInstance = new Domaine(params)
        if(!domaineInstance.hasErrors() && domaineInstance.save()) {
            flash.message = "Domaine ${domaineInstance.id} created"
            redirect(action:show,id:domaineInstance.id)
        }
        else {
            render(view:'create',model:[domaineInstance:domaineInstance])
        }
    }
}
