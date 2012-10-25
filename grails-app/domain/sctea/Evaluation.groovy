package sctea

class Evaluation {
    
    int valeur
    
    Periode periode
    Competence competence
    Eleve eleve
    
    static belongsTo = [ rapport:Rapport ]

    static constraints = {
    }
}
