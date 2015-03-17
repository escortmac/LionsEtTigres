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
    
    var tigres:[Tigre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var unTigre = Tigre()
        unTigre.nom = "Tigre"
        unTigre.race = "Bengale"
        unTigre.age = 5
        unTigre.image = UIImage (named: "BengalTiger.jpg")
        
        tigres.append(unTigre)
        
        
        println("Le nom de mon tigre est : \(unTigre.nom), son âge est \(unTigre.age) ans, sa race est \(unTigre.race) et son image est \(unTigre.image)")
        
        monImage.image = unTigre.image
        nom.text = unTigre.nom
        age.text = "\(unTigre.age)"
        race.text = unTigre.race
        
        var secondTigre = Tigre()
        secondTigre.nom = "Tigresse"
        secondTigre.race = "Tigre indochinois"
        secondTigre.age = 2
        secondTigre.image = UIImage(named: "IndochineseTiger.jpg")
        
        var troisiemeTigre = Tigre()
        troisiemeTigre.nom = "Jacob"
        troisiemeTigre.race = "Tigre malais"
        troisiemeTigre.age = 4
        troisiemeTigre.image = UIImage (named: "MalayanTiger.jpg")
        
        var quatriemeTigre = Tigre()
        quatriemeTigre.nom = "Ynsigo"
        quatriemeTigre.race = "Tigre de Sibérie"
        quatriemeTigre.age = 6
        quatriemeTigre.image = UIImage (named: "SiberianTiger.jpg")
        
        tigres += [secondTigre, troisiemeTigre, quatriemeTigre]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func boutonSuivantBarreDOutil(sender: UIBarButtonItem) {
        
       let indiceAleatoire = Int(arc4random_uniform(UInt32(tigres.count)))
        let tigre = tigres[indiceAleatoire]
        monImage.image = tigre.image
        nom.text = tigre.nom
        age.text = "\(tigre.age)"
        race.text = tigre.race
    }

}

