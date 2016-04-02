//
//  ImageTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 28/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    // MARK: - Private Constants
    
    
    // MARK: - Private Variables
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var bottomSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var topSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var principalImageView: UIImageView!
    
    
    // MARK: - IBActions
    
    
    // MARK: - "Default" Methods
    
    
    // MARK: - Delegates
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 0 {
            // scrolling down
            containerView.clipsToBounds = true
            bottomSpaceConstraint?.constant = -scrollView.contentOffset.y / 2
            topSpaceConstraint?.constant = scrollView.contentOffset.y / 2
        } else {
            // scrolling up
            topSpaceConstraint?.constant = scrollView.contentOffset.y
            containerView.clipsToBounds = false
        }
    }
    
    
    // MARK: - Personnal Delegates
    
    
    // MARK: - Personnal Methods
    internal static func imageCell() -> ImageTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("ImageTableViewCell", owner: self, options: nil)
        let cell: ImageTableViewCell = nibs[0] as! ImageTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}
