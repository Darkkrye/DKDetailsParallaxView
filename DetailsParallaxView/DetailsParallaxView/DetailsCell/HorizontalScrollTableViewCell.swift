//
//  HorizontalScrollTableViewCell.swift
//  DetailsParallaxView
//
//  Created by Pierre on 28/04/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit



class DKIndexedCollectionView: UICollectionView {
    var index: Int = 0
}

class HorizontalScrollTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellCollectionView: DKIndexedCollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: protocol<UICollectionViewDataSource, UICollectionViewDelegate>, index: Int) {
        let nib: UINib = UINib(nibName: "HorizontalScrollCollectionViewCell", bundle: nil)
        self.cellCollectionView.registerNib(nib, forCellWithReuseIdentifier: "HorizontalScrollCollectionViewCell")
        self.cellCollectionView.dataSource = dataSourceDelegate
        self.cellCollectionView.delegate = dataSourceDelegate
        self.cellCollectionView.index = index
        self.cellCollectionView.reloadData()
    }
    
    internal static func horizontalScroll() -> HorizontalScrollTableViewCell {
        let nibs = NSBundle.mainBundle().loadNibNamed("HorizontalScrollTableViewCell", owner: self, options: nil)
        let cell: HorizontalScrollTableViewCell = nibs[0] as! HorizontalScrollTableViewCell
        cell.selectionStyle = .None
        
        return cell
    }
}