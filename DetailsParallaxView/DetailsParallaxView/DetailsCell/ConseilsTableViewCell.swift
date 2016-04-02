//
//  ConseilsTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 27/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class ConseilsTableViewCell: UITableViewCell {
    
    // MARK: - Private Constants
    
    
    // MARK: - Private Variables
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var conseilsLabel: UILabel!
    
    
    // MARK: - IBActions
    
    
    // MARK: - "Default" Methods
    
    
    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    internal static func conseilsCell() -> ConseilsTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("ConseilsTableViewCell", owner: self, options: nil)
        let cell: ConseilsTableViewCell = nibs[0] as! ConseilsTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}
