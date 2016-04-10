//
//  PreparingBakingTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 10/04/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class PreparingBakingTableViewCell: UITableViewCell {

    // MARK: - Private Constants
    
    
    // MARK: - Private Variables
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var preparingTimeLabel: UILabel!
    @IBOutlet weak var bakingTimeLabel: UILabel!
    
    
    // MARK: - IBActions
    
    
    // MARK: - "Default" Methods
    
    
    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    internal static func preparingBakingCell() -> PreparingBakingTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("PreparingBakingTableViewCell", owner: self, options: nil)
        let cell: PreparingBakingTableViewCell = nibs[0] as! PreparingBakingTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
    
}
