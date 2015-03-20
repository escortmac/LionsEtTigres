//
//  Lion.swift
//  LionsEtTigres
//
//  Created by PHILIPPE PESCATORE 2 on 20/03/2015.
//  Copyright (c) 2015 iAtelier. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var estMaleAlpha = false
    var image = UIImage (named: "")
    var nom = ""
    var sousEspeces = ""
    
    func rugir () {
        println("Lion: roar roar")
    }
    
    func changerVersAlphaMale () {
        self.estMaleAlpha = true
    }
    
    func faitAleatoire () -> String {
        var faitAleatoire: String
        
        if self.estMaleAlpha == true {
            faitAleatoire = "les lions mâles sont faciles à reconnaître grâce à leurs crinières. Males avec une crinière noire attirent plus encore les femelles."
        } else {
            faitAleatoire = "les lionnes forment un groupe stable et ne tolèrent pas des femelles extérieures."
        }
        
        return faitAleatoire
    }
}
