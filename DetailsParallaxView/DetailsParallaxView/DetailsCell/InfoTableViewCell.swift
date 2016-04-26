//
//  InfoTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 23/04/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    // MARK: - Private Constants
    
    
    // MARK: - Private Variables
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userTitleLabel: UILabel!
    
    // MARK: - IBActions

    
    
    // MARK: - "Default" Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width/2
        self.userImageView.layer.masksToBounds = true
    }
    
    
    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    internal static func info() -> InfoTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("InfoTableViewCell", owner: self, options: nil)
        let cell: InfoTableViewCell = nibs[0] as! InfoTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
    
}
