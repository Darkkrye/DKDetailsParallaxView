//
//  ParallaxDetailsViewProtocol.swift
//  DetailsParallaxView
//
//  Created by Pierre on 27/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ParallaxDetailsViewDelegate {
    optional
    func favoriteAuthorButtonTapped(button: UIButton)
    func reserveButtonTapped(button: UIButton)
    func moreButtonTapped(button: UIButton)
    func theMoreButtonTapped(button: UIButton)
    func pickerViewUpdateLabel(button: UIButton, text: String)
    func imagePager(imagePager: KIImagePager, didSelectImage image: UIImage)
    func cellSelected(button: UIButton)
}