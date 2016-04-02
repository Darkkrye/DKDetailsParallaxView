//
//  MoreImagesTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 28/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class MoreImagesTableViewCell: UITableViewCell, KIImagePagerDelegate, KIImagePagerDataSource {
    
    // MARK: - Private Constants
    
    
    // MARK: - Private Variables
    var images = [UIImage]()
    var delegate: ParallaxDetailsViewDelegate?
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagePager: KIImagePager!
    
    
    // MARK: - IBActions
    
    
    // MARK: - "Default" Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imagePager.delegate = self
        self.imagePager.dataSource = self
    }
    
    
    // MARK: - Delegates
    
    
    // MARK: - Personnal Delegates
    func arrayWithImages(pager: KIImagePager!) -> [AnyObject]! {
        return self.images
    }
    
    func contentModeForImage(image: UInt, inPager pager: KIImagePager!) -> UIViewContentMode {
        return UIViewContentMode.ScaleToFill
    }
    
    func imagePager(imagePager: KIImagePager!, didSelectImageAtIndex index: UInt) {
        if let delegate = self.delegate {
            delegate.imagePager(imagePager, didSelectImage: self.images[Int(index)])
        }
    }
    
    
    // MARK: - Personnal Methods
    internal static func moreImagesCell() -> MoreImagesTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("MoreImagesTableViewCell", owner: self, options: nil)
        let cell: MoreImagesTableViewCell = nibs[0] as! MoreImagesTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}
