//
//  Lionceau.swift
//  LionsEtTigres
//
//  Created by PHILIPPE PESCATORE 2 on 20/03/2015.
//  Copyright (c) 2015 iAtelier. All rights reserved.
//

import Foundation
import UIKit

class Lionceau: Lion {
    
    var estMale = false
    
    func frotterLeVentreDuLionceau () {
        println("Lionceau : se blottir et être heureux")
    }
    
    override func rugir() {
        super.rugir()
        println("Lionceau : groar groar")
    }
    
    override func faitAleatoire() -> String {
    
        var faitAleatoire : String
        if self.estMale {
            faitAleatoire = "lionceaux sont habituellement cachés dans les buissons pendant 6 semaines."
        } else {
            faitAleatoire = "lionceaux commencent à manger de la viande au bout de 6 semaines."
        }
        return faitAleatoire
    }
    
}