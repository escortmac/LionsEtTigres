//
//  Tigre.swift
//  LionsEtTigres
//
//  Created by PHILIPPE PESCATORE 2 on 16/03/2015.
//  Copyright (c) 2015 iAtelier. All rights reserved.
//

import Foundation
import UIKit

struct Tigre {
    var age = 0 // typage et valeur par défaut
    var nom = ""
    var race = ""
    var image = UIImage(named: "")
    
    func crier() {
        println("Tigre : rrrrr rrrrr")
    }
    func crierPlusieursFois (fois : Int) {
        for var crier = 0 ; crier < fois ; ++crier {
            self.crier()
        }
    }
    
    func crierPlusieursFois (fois : Int, estFort : Bool) {
        for var crierRepetitions = 1; crierRepetitions <= fois; crierRepetitions++ {
            if estFort {
                crier()
            } else {
                println("Tigre: prout prout")
            }
        }
    }
    
    func ageEnAnneesDeTigre (ageNormal: Int) -> Int {
        let ageConverti = ageNormal * 3
        return ageConverti
    }
    
    func faitAleatoire () -> String {
        
//        self.race = ""
        
        let nombreAleatoire = Int(arc4random_uniform(UInt32(3)))
        var faitAleatoire:String
        
        if nombreAleatoire == 0 {
            faitAleatoire = "Le Tigre est la plus grosse espèce de félins"
        } else if nombreAleatoire == 1 {
            faitAleatoire = "Les tigres peuvent atteindre une longueur de 3,3 mètres"
        } else {
            faitAleatoire = "Un groupe de tigres s'appelle une Meute"
        }
        return faitAleatoire
    }
    
}