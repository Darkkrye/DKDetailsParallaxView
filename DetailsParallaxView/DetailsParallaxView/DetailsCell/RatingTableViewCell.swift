//
//  RatingTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 27/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class RatingTableViewCell: UITableViewCell {
    
    // MARK: - Private Constants
    
    
    // MARK: - Private Variables
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    // MARK: - IBActions
    
    
    // MARK: - "Default" Methods
    
    
    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    internal static func ratingCell() -> RatingTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("RatingTableViewCell", owner: self, options: nil)
        let cell: RatingTableViewCell = nibs[0] as! RatingTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}
