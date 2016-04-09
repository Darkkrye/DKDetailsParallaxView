//
//  PickerViewTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 06/04/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class PickerViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var compensationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.compensationLabel.text = "Test"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    internal static func pickerViewCell() -> PickerViewTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("PickerViewTableViewCell", owner: self, options: nil)
        let cell: PickerViewTableViewCell = nibs[0] as! PickerViewTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}
