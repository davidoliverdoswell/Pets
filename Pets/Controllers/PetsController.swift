//
//  PetsController.swift
//  Pets
//
//  Created by David Oliver Doswell on 7/24/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import Foundation

class PetsController {
    
    func createPet(name: String, kingdom: String, age: String) -> Pet {
        
        let pet = Pet(name: name, kingdom: kingdom, age: age)
        pets.append(pet)
        
        return pet
    }
    
    func updatePet(pet: Pet, withName name: String, kingdom: String, age: String) {
        
        guard let index = pets.index(of: pet) else { return }
        
        var animal = pet
        animal.name = name
        animal.kingdom = kingdom
        animal.age = age
        
        pets.remove(at: index)
        pets.insert(animal, at: index)
    }
    
    private(set) var pets = [Pet]()
}
