//
//  PetsDetailViewController.swift
//  Pets
//
//  Created by David Oliver Doswell on 7/24/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit

class PetsDetailViewController: UIViewController {

    // MARK: - Constants
    var pet: Pet?
    var petsController: PetsController?
    
    // MARK: - Properties
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var kingdom: UITextField!
    
    @IBOutlet weak var age: UITextField!
    
    // MARK: - Actions
    @IBAction func save(_ sender: Any) {
        guard let name = name.text, let kingdom = kingdom.text, let age = age.text else { return }
        
        if let pet = pet {
            petsController?.updatePet(pet: pet, withName: name, kingdom: kingdom, age: age)
        } else {
            let _ = petsController?.createPet(name: name, kingdom: kingdom, age: age)
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI() {
        guard let pet = pet else {
            self.title = "Add a New Pet 🐶"
            return
        }
        self.title = pet.name
        
        name.text = pet.name
        kingdom.text = pet.kingdom
        age.text = pet.age
        }
    
}
