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
    optional func favoriteAuthorButtonTapped(button: UIButton)
    optional func reserveButtonTapped(button: UIButton)
    optional func moreButtonTapped(button: UIButton)
    optional func theMoreButtonTapped(button: UIButton)
}