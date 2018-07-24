//
//  PetsTableViewController.swift
//  Pets
//
//  Created by David Oliver Doswell on 7/24/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit

class PetsTableViewController: UITableViewController {
    
    var petsController = PetsController()

    // MARK: - Table reload
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return petsController.pets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let pet = petsController.pets[indexPath.row]
        cell.textLabel?.text = pet.name

        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCreatedPet" {
            
            guard let destination = segue.destination as? PetsDetailViewController else { return }
            
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            destination.petsController = petsController
            destination.pet = petsController.pets[indexPath.row]
            
        } else if segue.identifier == "ShowAddPet" {
            
            guard let destination = segue.destination as? PetsDetailViewController else { return }
            
            destination.petsController = petsController
        }
    }

}
