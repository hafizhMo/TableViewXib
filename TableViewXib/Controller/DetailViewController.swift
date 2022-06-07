//
//  DetailViewController.swift
//  TableViewXib
//
//  Created by Hafizh Mo on 07/06/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var profileBirthday: UILabel!
    @IBOutlet weak var profileName: UILabel!
    
    var name = ""
    var birthday = ""
    var photo = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileName.text = name
        profileBirthday.text = birthday
        profilePhoto.image = photo
    }
}
