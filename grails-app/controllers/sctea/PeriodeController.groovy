
package sctea

import grails.converters.*

class PeriodeController {
    
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        withFormat {
            html { [ periodeInstanceList: Periode.list( params ), periodeInstanceTotal: Periode.count() ] }
            xml { render Periode.list( params ) as XML  }
            json { render Periode.list( params ) as JSON  }
        }
    }

    def show = {
        withFormat{
            html {
                def periodeInstance = Periode.get( params.id )

                if(!periodeInstance) {
                    flash.message = "Periode not found with id ${params.id}"
                    redirect(action:list)
                }
                else { return [ periodeInstance : periodeInstance ] } }
            xml { render  Periode.get( params.id ) as XML }
            json { render  Periode.get( params.id ) as JSON }
        }
    }

    def delete = {
        def periodeInstance = Periode.get( params.id )
        if(periodeInstance) {
            periodeInstance.delete()
            flash.message = "Periode ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Periode not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def periodeInstance = Periode.get( params.id )

        if(!periodeInstance) {
            flash.message = "Periode not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ periodeInstance : periodeInstance ]
        }
    }

    def update = {
        def periodeInstance = Periode.get( params.id )
        if(periodeInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(periodeInstance.version > version) {
                    
                    periodeInstance.errors.rejectValue("version", "periode.optimistic.locking.failure", "Another user has updated this Periode while you were editing.")
                    render(view:'edit',model:[periodeInstance:periodeInstance])
                    return
                }
            }
            periodeInstance.properties = params
            if(!periodeInstance.hasErrors() && periodeInstance.save()) {
                flash.message = "Periode ${params.id} updated"
                redirect(action:show,id:periodeInstance.id)
            }
            else {
                render(view:'edit',model:[periodeInstance:periodeInstance])
            }
        }
        else {
            flash.message = "Periode not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def periodeInstance = new Periode()
        periodeInstance.properties = params
        return ['periodeInstance':periodeInstance]
    }

    def save = {
        def periodeInstance = new Periode(params)
        if(!periodeInstance.hasErrors() && periodeInstance.save()) {
            flash.message = "Periode ${periodeInstance.id} created"
            redirect(action:show,id:periodeInstance.id)
        }
        else {
            render(view:'create',model:[periodeInstance:periodeInstance])
        }
    }
}
