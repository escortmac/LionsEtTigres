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
    var lions:[Lion] = []
    
    var indiceCourant = 0
    
    var tupleAnimalCourant = (espèce: "Tigre", indice: 0)
    
    var lionceaux : [Lionceau] = []
    
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
        
        unTigre.crierPlusieursFois(4)
        secondTigre.crierPlusieursFois(2)
        
        self.tigres += [secondTigre, troisiemeTigre, quatriemeTigre]
        
        var lion = Lion() // initialisation d'une instance de Lion
        lion.age = 4
        lion.estMaleAlpha = false
        lion.image = UIImage (named: "lion.jpg")
        lion.nom = "Mufasa"
        lion.sousEspeces = "Afrique de l'Ouest"
       
        println("l'âge du Lion est \(lion.age) et le nom du lion est \(lion.nom) et la sous-espèce est \(lion.sousEspeces)")
        
        lion.rugir()
        lion.changerVersAlphaMale()
        
        if lion.estMaleAlpha == true {
            println("Le lion est maintenant un Alpha")
        }
        
        var lionne = Lion()
        lionne.age = 3
        lionne.nom = "Sarabi"
        lionne.image = UIImage(named: "Lioness.jpeg")
        lionne.estMaleAlpha = false
        lionne.sousEspeces = "barbary"
        
        lionne.rugir()
        
        self.lions += [lion, lionne]
        
        var lionceau = Lionceau() //instanciation de la Classe Lionceau
        lionceau.age = 1
        lionceau.nom = "Simba"
        lionceau.image = UIImage (named: "LionCub1.jpg")
        lionceau.sousEspeces = "Masai"
        lionceau.estMale = true
        
        println("Lionceau devrait rugir après cette déclaration")
        lionceau.rugir()
        lionceau.frotterLeVentreDuLionceau()
        
        var lioncelle = Lionceau()
        lioncelle.age = 1
        lioncelle.nom = "Nala"
        lioncelle.image = UIImage (named: "LionCub2.jpeg")
        lioncelle.sousEspeces = "Transvaal"
        lioncelle.estMale = false
        
        self.lionceaux += [lionceau, lioncelle]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func miseAJourAnimal () {
        switch tupleAnimalCourant {
        case ("Tigre", _) :
            let indiceAleatoire = Int(arc4random_uniform(UInt32(lions.count)))
            tupleAnimalCourant = ("Lion", indiceAleatoire)
        case ("Lion",_) :
            let indiceAleatoire = Int(arc4random_uniform(UInt32(lionceaux.count)))
            tupleAnimalCourant = ("Lionceau", indiceAleatoire)
            
        default :
            let indiceAleatoire = Int(arc4random_uniform(UInt32(tigres.count)))
            tupleAnimalCourant = ("Tigre", indiceAleatoire)
        }
    }
    
    func miseAJourVue () {
        UIView.transitionWithView(
            self.view,
            duration: 2,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                
                if self.tupleAnimalCourant.espèce == "Tigre" {
                    let tigre = self.tigres[self.tupleAnimalCourant.indice]
                    self.monImage.image = tigre.image
                    self.race.text = tigre.race
                    self.age.text = "\(tigre.age)"
                    self.nom.text = tigre.nom
                    self.faitAleatoireEtiquette.text = tigre.faitAleatoire()
                    
                } else if self.tupleAnimalCourant.espèce == "Lion" {
                    let lion = self.lions [self.tupleAnimalCourant.indice]
                    self.monImage.image = lion.image
                    self.race.text = lion.sousEspeces
                    self.age.text = "\(lion.age)"
                    self.nom.text = lion.nom
                    self.faitAleatoireEtiquette.text = lion.faitAleatoire()
                } else if self.tupleAnimalCourant.espèce == "Lionceau" {
                    let lionceau = self.lionceaux [self.tupleAnimalCourant.indice]
                    self.monImage.image = lionceau.image
                    self.race.text = lionceau.sousEspeces
                    self.nom.text = lionceau.nom
                    self.age.text = "\(lionceau.age)"
                    self.faitAleatoireEtiquette.text = lionceau.faitAleatoire()
                }

            },
            completion: {
                (finished:Bool) -> () in
        })
    }

    @IBAction func boutonSuivantBarreDOutil(sender: UIBarButtonItem) {
        
        println("\(sender)")
//        miseAJourTigre()

        miseAJourAnimal()
        miseAJourVue()
    }

    func miseAJourTigre () {
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

