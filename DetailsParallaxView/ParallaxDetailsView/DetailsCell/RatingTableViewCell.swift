//
//  RatingTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 27/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class RatingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal static func ratingCell() -> RatingTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("RatingTableViewCell", owner: self, options: nil)
        let cell: RatingTableViewCell = nibs[0] as! RatingTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}
