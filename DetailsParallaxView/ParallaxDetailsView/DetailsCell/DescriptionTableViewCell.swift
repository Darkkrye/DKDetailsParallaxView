//
//  DescriptionTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 27/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal static func descriptionCell() -> DescriptionTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("DescriptionTableViewCell", owner: self, options: nil)
        let cell: DescriptionTableViewCell = nibs[0] as! DescriptionTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}
