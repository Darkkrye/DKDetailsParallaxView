//
//  MoreTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 27/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {
    
    // MARK: - Private Constants
    
    
    // MARK: - Private Variables
    var delegate: ParallaxDetailsViewDelegate!
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var moreButton: UIButton!
    
    
    // MARK: - IBActions
    @IBAction func moreButtonTapped(sender: UIButton) {
        if let delegate = self.delegate {
            delegate.theMoreButtonTapped(self.moreButton)
        }
    }
    
    
    // MARK: - "Default" Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.moreButton.layer.borderColor = self.moreButton.titleLabel?.textColor.CGColor
        self.moreButton.layer.borderWidth = 1.0
        self.moreButton.layer.cornerRadius = 15.0
    }
    
    
    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    internal static func moreCell() -> MoreTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("MoreTableViewCell", owner: self, options: nil)
        let cell: MoreTableViewCell = nibs[0] as! MoreTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}
