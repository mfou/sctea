package sctea

class Observation {

    String observation
    Eleve eleve
    
    static belongsTo = [ rapport:Rapport ]
    
    static constraints = {
    }
}
