//
//  HeaderSectionCell.swift
//  TableViewXib
//
//  Created by Hafizh Mo on 07/06/22.
//

import UIKit

class HeaderSectionCell: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleSectionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 104)
    }
    
    private func commonInit() {
        let bundle = Bundle(for: HeaderSectionCell.self)
        bundle.loadNibNamed("HeaderSectionCell", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    }
}
