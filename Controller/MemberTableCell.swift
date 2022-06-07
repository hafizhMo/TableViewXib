//
//  MemberTableCell.swift
//  TableViewXib
//
//  Created by Hafizh Mo on 06/06/22.
//

import Foundation
import UIKit

class MemberTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var zodiacLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.contentMode = .top
        profileImage.layer.borderWidth = 2
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.gray.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
    }
}
