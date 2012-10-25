
package sctea

import grails.converters.*

class EvaluationController {
    
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        withFormat {
            html { [ evaluationInstanceList: Evaluation.list( params ), evaluationInstanceTotal: Evaluation.count() ] }
            xml { render Evaluation.list( params ) as XML  }
            json { render Evaluation.list( params ) as JSON  }
        }
    }

    def show = {
        withFormat{
            html {
                def evaluationInstance = Evaluation.get( params.id )

                if(!evaluationInstance) {
                    flash.message = "Evaluation not found with id ${params.id}"
                    redirect(action:list)
                }
                else { return [ evaluationInstance : evaluationInstance ] } }
            xml { render  Evaluation.get( params.id ) as XML }
            json { render  Evaluation.get( params.id ) as JSON }
        }
    }

    def delete = {
        def evaluationInstance = Evaluation.get( params.id )
        if(evaluationInstance) {
            evaluationInstance.delete()
            flash.message = "Evaluation ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Evaluation not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def evaluationInstance = Evaluation.get( params.id )

        if(!evaluationInstance) {
            flash.message = "Evaluation not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ evaluationInstance : evaluationInstance ]
        }
    }

    def update = {
        def evaluationInstance = Evaluation.get( params.id )
        if(evaluationInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(evaluationInstance.version > version) {
                    
                    evaluationInstance.errors.rejectValue("version", "evaluation.optimistic.locking.failure", "Another user has updated this Evaluation while you were editing.")
                    render(view:'edit',model:[evaluationInstance:evaluationInstance])
                    return
                }
            }
            evaluationInstance.properties = params
            if(!evaluationInstance.hasErrors() && evaluationInstance.save()) {
                flash.message = "Evaluation ${params.id} updated"
                redirect(action:show,id:evaluationInstance.id)
            }
            else {
                render(view:'edit',model:[evaluationInstance:evaluationInstance])
            }
        }
        else {
            flash.message = "Evaluation not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def evaluationInstance = new Evaluation()
        evaluationInstance.properties = params
        return ['evaluationInstance':evaluationInstance]
    }

    def save = {
        def evaluationInstance = new Evaluation(params)
        if(!evaluationInstance.hasErrors() && evaluationInstance.save()) {
            flash.message = "Evaluation ${evaluationInstance.id} created"
            redirect(action:show,id:evaluationInstance.id)
        }
        else {
            render(view:'create',model:[evaluationInstance:evaluationInstance])
        }
    }
}
