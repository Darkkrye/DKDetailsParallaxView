//
//  ConseilsTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 27/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class ConseilsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var conseilsLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal static func conseilsCell() -> ConseilsTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("ConseilsTableViewCell", owner: self, options: nil)
        let cell: ConseilsTableViewCell = nibs[0] as! ConseilsTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}
