
package sctea

import grails.converters.*

class ObservationController {
    
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        withFormat {
            html { [ observationInstanceList: Observation.list( params ), observationInstanceTotal: Observation.count() ] }
            xml { render Observation.list( params ) as XML  }
            json { render Observation.list( params ) as JSON  }
        }
    }

    def show = {
        withFormat{
            html {
                def observationInstance = Observation.get( params.id )

                if(!observationInstance) {
                    flash.message = "Observation not found with id ${params.id}"
                    redirect(action:list)
                }
                else { return [ observationInstance : observationInstance ] } }
            xml { render  Observation.get( params.id ) as XML }
            json { render  Observation.get( params.id ) as JSON }
        }
    }

    def delete = {
        def observationInstance = Observation.get( params.id )
        if(observationInstance) {
            observationInstance.delete()
            flash.message = "Observation ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Observation not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def observationInstance = Observation.get( params.id )

        if(!observationInstance) {
            flash.message = "Observation not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ observationInstance : observationInstance ]
        }
    }

    def update = {
        def observationInstance = Observation.get( params.id )
        if(observationInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(observationInstance.version > version) {
                    
                    observationInstance.errors.rejectValue("version", "observation.optimistic.locking.failure", "Another user has updated this Observation while you were editing.")
                    render(view:'edit',model:[observationInstance:observationInstance])
                    return
                }
            }
            observationInstance.properties = params
            if(!observationInstance.hasErrors() && observationInstance.save()) {
                flash.message = "Observation ${params.id} updated"
                redirect(action:show,id:observationInstance.id)
            }
            else {
                render(view:'edit',model:[observationInstance:observationInstance])
            }
        }
        else {
            flash.message = "Observation not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def observationInstance = new Observation()
        observationInstance.properties = params
        return ['observationInstance':observationInstance]
    }

    def save = {
        def observationInstance = new Observation(params)
        if(!observationInstance.hasErrors() && observationInstance.save()) {
            flash.message = "Observation ${observationInstance.id} created"
            redirect(action:show,id:observationInstance.id)
        }
        else {
            render(view:'create',model:[observationInstance:observationInstance])
        }
    }
}
