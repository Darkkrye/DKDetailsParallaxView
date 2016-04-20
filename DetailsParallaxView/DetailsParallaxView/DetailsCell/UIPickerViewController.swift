//
//  UIPickerViewController.swift
//  DetailsParallaxView
//
//  Created by Pierre on 19/04/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class UIPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerBackgroundView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var chooseButton: UIButton!
    
    var counterParties: [String]!
    var delegate: ParallaxDetailsViewDelegate?
    
    var selectedString: String!

    @IBAction func backButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func chooseButtonTapped(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.pickerViewUpdateLabel(self.chooseButton, text: self.selectedString)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.modalPresentationStyle = .OverCurrentContext
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        self.pickerBackgroundView.layer.borderWidth = 1
        self.pickerBackgroundView.layer.borderColor = UIColor.whiteColor().CGColor
        self.pickerBackgroundView.layer.cornerRadius = 10.0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.selectedString = self.counterParties.first
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.counterParties.count
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: self.counterParties[row], attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()])
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedString = self.counterParties[row]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
