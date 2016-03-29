//
//  MoreTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 27/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moreButton: UIButton!
    
    @IBAction func moreButtonTapped(sender: UIButton) {
        if let delegate = self.delegate {
            delegate.theMoreButtonTapped(self.moreButton)
        }
    }
    
    var delegate: ParallaxDetailsViewDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.moreButton.layer.borderColor = self.moreButton.titleLabel?.textColor.CGColor
        self.moreButton.layer.borderWidth = 1.0
        self.moreButton.layer.cornerRadius = 15.0
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    internal static func moreCell() -> MoreTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("MoreTableViewCell", owner: self, options: nil)
        let cell: MoreTableViewCell = nibs[0] as! MoreTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}
