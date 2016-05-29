//
//  HorizontalScrollCollectionViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 28/04/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class HorizontalScrollCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageImageView.layer.cornerRadius = 2
        self.imageImageView.layer.masksToBounds = true
        
        self.cellBackgroundView.layer.cornerRadius = self.imageImageView.layer.cornerRadius
        self.cellBackgroundView.layer.masksToBounds = true
        self.cellBackgroundView.layer.borderColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1).CGColor
        self.cellBackgroundView.layer.borderWidth = 1
    }
    
    internal static func horizontalScroll() -> HorizontalScrollCollectionViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("HorizontalScrollCollectionViewCell", owner: self, options: nil)
        let cell: HorizontalScrollCollectionViewCell = nibs[0] as! HorizontalScrollCollectionViewCell
        
        return cell
    }

}
