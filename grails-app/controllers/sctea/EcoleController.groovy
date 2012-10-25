package sctea

import grails.converters.*

class EcoleController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        withFormat {
            html { [ ecoleInstanceList: Ecole.list( params ), ecoleInstanceTotal: Ecole.count() ] }
            xml { render Ecole.list( params ) as XML  }
            json { render Ecole.list( params ) as JSON  }
        }
    }

    def show = {
        withFormat{
            html {
                def ecoleInstance = Ecole.get( params.id )

                if(!ecoleInstance) {
                    flash.message = "Ecole not found with id ${params.id}"
                    redirect(action:list)
                }
                else { return [ ecoleInstance : ecoleInstance ] } }
            xml { render  Ecole.get( params.id ) as XML }
            json { render  Ecole.get( params.id ) as JSON }
        }
    }

    def delete = {
        def ecoleInstance = Ecole.get( params.id )
        if(ecoleInstance) {
            ecoleInstance.delete()
            flash.message = "Ecole ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Ecole not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def ecoleInstance = Ecole.get( params.id )

        if(!ecoleInstance) {
            flash.message = "Ecole not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ ecoleInstance : ecoleInstance ]
        }
    }

    def update = {
        def ecoleInstance = Ecole.get( params.id )
        if(ecoleInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(ecoleInstance.version > version) {
                    
                    ecoleInstance.errors.rejectValue("version", "ecole.optimistic.locking.failure", "Another user has updated this Ecole while you were editing.")
                    render(view:'edit',model:[ecoleInstance:ecoleInstance])
                    return
                }
            }
            ecoleInstance.properties = params
            if(!ecoleInstance.hasErrors() && ecoleInstance.save()) {
                flash.message = "Ecole ${params.id} updated"
                redirect(action:show,id:ecoleInstance.id)
            }
            else {
                render(view:'edit',model:[ecoleInstance:ecoleInstance])
            }
        }
        else {
            flash.message = "Ecole not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def ecoleInstance = new Ecole()
        ecoleInstance.properties = params
        return ['ecoleInstance':ecoleInstance]
    }

    def save = {
        def ecoleInstance = new Ecole(params)
        if(!ecoleInstance.hasErrors() && ecoleInstance.save()) {
            flash.message = "Ecole ${ecoleInstance.id} created"
            redirect(action:show,id:ecoleInstance.id)
        }
        else {
            render(view:'create',model:[ecoleInstance:ecoleInstance])
        }
    }
}
