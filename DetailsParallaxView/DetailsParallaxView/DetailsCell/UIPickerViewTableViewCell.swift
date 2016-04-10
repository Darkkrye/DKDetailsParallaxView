//
//  UIPickerViewTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 06/04/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class UIPickerViewTableViewCell: UITableViewCell/*, UIPickerViewDataSource, UIPickerViewDelegate*/ {

    @IBOutlet weak var compensationPickerView: UIPickerView!
    
    //var array: [String] = [String]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        /*self.compensationPickerView.delegate = self
        self.compensationPickerView.dataSource = self*/
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.array[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.array.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }*/
    
    internal static func uiPickerViewCell() -> UIPickerViewTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("UIPickerViewTableViewCell", owner: self, options: nil)
        let cell: UIPickerViewTableViewCell = nibs[0] as! UIPickerViewTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}
