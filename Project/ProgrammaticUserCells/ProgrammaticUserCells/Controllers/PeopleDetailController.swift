//
//  PeopleDetailController.swift
//  ProgrammaticUserCells
//
//  Created by Melinda Diaz on 1/31/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class PeopleDetailController: UIViewController {

    @IBOutlet weak var peoplePhoto: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    var people: User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    

    
}
