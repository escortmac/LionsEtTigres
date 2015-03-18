//
//  ViewController.swift
//  LionsEtTigres
//
//  Created by PHILIPPE PESCATORE 2 on 16/03/2015.
//  Copyright (c) 2015 iAtelier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monImage: UIImageView!
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var race: UILabel!
    @IBOutlet weak var faitAleatoireEtiquette: UILabel!
    
    var tigres:[Tigre] = [] // déclaration et init du tableau des Instances de la Classe Tigre
    
    var indiceCourant = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var unTigre = Tigre()
        unTigre.nom = "Tigre"
        unTigre.race = "Bengale"
        unTigre.age = 5
        unTigre.image = UIImage (named: "BengalTiger.jpg")
        
        unTigre.age = unTigre.ageEnAnneesDeTigre(unTigre.age)
        
        unTigre.crier()
        unTigre.crierPlusieursFois(5, estFort: false)
        
        tigres.append(unTigre)
        
        
        println("Le nom de mon tigre est : \(unTigre.nom), son âge est \(unTigre.age) ans, sa race est \(unTigre.race) et son image est \(unTigre.image)")
        
        monImage.image = unTigre.image
        nom.text = unTigre.nom
        age.text = "\(unTigre.age)"
        race.text = unTigre.race
        faitAleatoireEtiquette.text = unTigre.faitAleatoire()
        
        var secondTigre = Tigre()
        secondTigre.nom = "Tigresse"
        secondTigre.race = "Tigre indochinois"
        secondTigre.age = 2
        secondTigre.image = UIImage(named: "IndochineseTiger.jpg")
        
        secondTigre.age = secondTigre.ageEnAnneesDeTigre(secondTigre.age)
        
        secondTigre.crier()
        
        var troisiemeTigre = Tigre()
        troisiemeTigre.nom = "Jacob"
        troisiemeTigre.race = "Tigre malais"
        troisiemeTigre.age = 4
        troisiemeTigre.image = UIImage (named: "MalayanTiger.jpg")
        
        troisiemeTigre.age = troisiemeTigre.ageEnAnneesDeTigre(troisiemeTigre.age)
        
        var quatriemeTigre = Tigre()
        quatriemeTigre.nom = "Ynsigo"
        quatriemeTigre.race = "Tigre de Sibérie"
        quatriemeTigre.age = 6
        quatriemeTigre.image = UIImage (named: "SiberianTiger.jpg")
        
        quatriemeTigre.age = quatriemeTigre.ageEnAnneesDeTigre(quatriemeTigre.age)
        
        tigres += [secondTigre, troisiemeTigre, quatriemeTigre]
        
        unTigre.crierPlusieursFois(4)
        secondTigre.crierPlusieursFois(2)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func boutonSuivantBarreDOutil(sender: UIBarButtonItem) {
        
        var indiceAleatoire:Int
        
        do {
            indiceAleatoire = Int(arc4random_uniform(UInt32(tigres.count)))
        } while indiceCourant == indiceAleatoire
        
        indiceCourant = indiceAleatoire
        
        let tigre = tigres[indiceAleatoire]
//        monImage.image = tigre.image
//        nom.text = tigre.nom
//        age.text = "\(tigre.age)"
//        race.text = tigre.race
        
        
        UIView.transitionWithView(
            self.view,
            duration: 2,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                self.monImage.image = tigre.image
                self.nom.text = tigre.nom
                self.age.text = "\(tigre.age)"
                self.race.text = tigre.race
                self.faitAleatoireEtiquette.text = tigre.faitAleatoire()
            },
            completion: {
                (finished:Bool) -> () in
        })
    }

}

