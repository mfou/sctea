package sctea

class Rapport {

    Classe classe
    Eleve eleve
    List evaluations = new ArrayList()
    List observations = new ArrayList()
    
    static hasMany = [ evaluations:Evaluation, observations:Observation ]

    static constraints = {
    }
}
