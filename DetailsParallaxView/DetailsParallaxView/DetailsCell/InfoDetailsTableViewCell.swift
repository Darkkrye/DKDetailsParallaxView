//
//  InfoDetailsTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 26/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class InfoDetailsTableViewCell: UITableViewCell {
    
    // MARK: - Private Constants
    
    
    // MARK: - Private Variables
    var delegate: ParallaxDetailsViewDelegate?
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var favoriteAuthorButton: UIButton!
    @IBOutlet weak var reserveButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    // MARK: - IBActions
    @IBAction func favoriteAuthorButtonTapped(sender: UIButton) {
        if let delegate = self.delegate {
            delegate.favoriteAuthorButtonTapped!(self.favoriteAuthorButton)
        }
    }
    
    @IBAction func reserveButtonTapped(sender: UIButton) {
        if let delegate = self.delegate {
            delegate.reserveButtonTapped(self.reserveButton)
        }
    }
    
    @IBAction func moreButtonTapped(sender: UIButton) {
        if let delegate = self.delegate {
            delegate.moreButtonTapped(self.moreButton)
        }
    }
    
    
    // MARK: - "Default" Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.authorImageView.layer.cornerRadius = self.authorImageView.frame.size.width/2
        self.authorImageView.layer.masksToBounds = true
        
        self.reserveButton.layer.borderColor = UIColor(red: 0, green: 161/255, blue: 0, alpha: 1).CGColor
        self.reserveButton.layer.cornerRadius = 15.0
        
        self.favoriteAuthorButton.layer.borderColor =  self.favoriteAuthorButton.titleLabel!.textColor.CGColor
        self.favoriteAuthorButton.layer.borderWidth = 1.0
        self.favoriteAuthorButton.layer.cornerRadius = 15.0
    }
    
    
    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    internal static func infoDetails() -> InfoDetailsTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("InfoDetailsTableViewCell", owner: self, options: nil)
        let cell: InfoDetailsTableViewCell = nibs[0] as! InfoDetailsTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}
