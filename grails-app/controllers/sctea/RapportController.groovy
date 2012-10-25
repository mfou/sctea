
package sctea

import grails.converters.*

class RapportController {
    
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        withFormat {
            html { [ rapportInstanceList: Rapport.list( params ), rapportInstanceTotal: Rapport.count() ] }
            xml { render Rapport.list( params ) as XML  }
            json { render Rapport.list( params ) as JSON  }
        }
    }

    def show = {
        withFormat{
            html {
                def rapportInstance = Rapport.get( params.id )

                if(!rapportInstance) {
                    flash.message = "Rapport not found with id ${params.id}"
                    redirect(action:list)
                }
                else { return [ rapportInstance : rapportInstance ] } }
            xml { render  Rapport.get( params.id ) as XML }
            json { render  Rapport.get( params.id ) as JSON }
        }
    }

    def delete = {
        def rapportInstance = Rapport.get( params.id )
        if(rapportInstance) {
            rapportInstance.delete()
            flash.message = "Rapport ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Rapport not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def rapportInstance = Rapport.get( params.id )

        if(!rapportInstance) {
            flash.message = "Rapport not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ rapportInstance : rapportInstance ]
        }
    }

    def update = {
        def rapportInstance = Rapport.get( params.id )
        if(rapportInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(rapportInstance.version > version) {
                    
                    rapportInstance.errors.rejectValue("version", "rapport.optimistic.locking.failure", "Another user has updated this Rapport while you were editing.")
                    render(view:'edit',model:[rapportInstance:rapportInstance])
                    return
                }
            }
            rapportInstance.properties = params
            if(!rapportInstance.hasErrors() && rapportInstance.save()) {
                flash.message = "Rapport ${params.id} updated"
                redirect(action:show,id:rapportInstance.id)
            }
            else {
                render(view:'edit',model:[rapportInstance:rapportInstance])
            }
        }
        else {
            flash.message = "Rapport not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def rapportInstance = new Rapport()
        rapportInstance.properties = params
        return ['rapportInstance':rapportInstance]
    }

    def save = {
        def rapportInstance = new Rapport(params)
        if(!rapportInstance.hasErrors() && rapportInstance.save()) {
            flash.message = "Rapport ${rapportInstance.id} created"
            redirect(action:show,id:rapportInstance.id)
        }
        else {
            render(view:'create',model:[rapportInstance:rapportInstance])
        }
    }
}
