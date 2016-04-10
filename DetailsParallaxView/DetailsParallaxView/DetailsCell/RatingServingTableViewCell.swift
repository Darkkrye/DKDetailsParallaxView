//
//  RatingServingTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 10/04/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class RatingServingTableViewCell: UITableViewCell {

    // MARK: - Private Constants
    
    
    // MARK: - Private Variables
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var servingLabel: UILabel!
    
    
    // MARK: - IBActions
    
    
    // MARK: - "Default" Methods
    
    
    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    internal static func ratingServingCell() -> RatingServingTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("RatingServingTableViewCell", owner: self, options: nil)
        let cell: RatingServingTableViewCell = nibs[0] as! RatingServingTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
    
}
