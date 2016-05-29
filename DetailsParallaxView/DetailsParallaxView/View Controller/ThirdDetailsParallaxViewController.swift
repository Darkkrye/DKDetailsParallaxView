//
//  ThirdDetailsParallaxViewController.swift
//  DetailsParallaxView
//
//  Created by Pierre on 23/04/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class ThirdDetailsParallaxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ParallaxDetailsViewDelegate, KMScrollingHeaderViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Private Constants
    let buttonBack = UIButton(type: .Custom)
    let blackImageView = UIView()
    let newImageView = UIImageView()
    
    
    // MARK: - Private Variables
    var dragging = false
    var oldX: CGFloat = 0.0
    var oldY: CGFloat = 0.0
    
    var endX: CGFloat = 0.0
    var endY: CGFloat = 0.0
    
    var statusBarHidden = true
    var imageLocation = CGPoint(x: 0, y: 0)
    
    var stringImages = ["http://www.blog.marche-prive.com/wp-content/uploads/2015/04/food58-burger-two-bleu-bacon.jpg",
                        "http://img1.gtsstatic.com/wallpapers/9b04890a3b057f005949ee85b16fc931_large.jpeg",
                        "http://www.blog.marche-prive.com/wp-content/uploads/2015/04/food58-burger-two-bleu-bacon.jpg",
                        "http://img1.gtsstatic.com/wallpapers/9b04890a3b057f005949ee85b16fc931_large.jpeg",
                        "http://www.blog.marche-prive.com/wp-content/uploads/2015/04/food58-burger-two-bleu-bacon.jpg",
                        "http://img1.gtsstatic.com/wallpapers/9b04890a3b057f005949ee85b16fc931_large.jpeg"]
    
    var images = [UIImage]()
    var imageUser: UIImage!
    
    var typePickerShouldOpen = false
    
    
    // MARK: - IBOutlets
    @IBOutlet var scrollingHeaderView: KMScrollingHeaderView!
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var navBarTitleLabel: UILabel!
    
    
    // MARK: - IBActions
    
    
    // MARK: - "Default" Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavbarButtons()
        self.setupDetailsPageView()
        self.navBar.alpha = 0
        UIApplication.sharedApplication().statusBarHidden = true
        
        for stringImage in stringImages {
            if let url = NSURL(string: stringImage), data = NSData(contentsOfURL: url) {
                self.images.append(UIImage(data: data)!)
            }
        }
        
        if let url = NSURL(string: "http://st.depositphotos.com/2101611/3923/v/950/depositphotos_39238767-Businessman-avatar-profile-picture.jpg"), data = NSData(contentsOfURL: url) {
            self.imageUser = UIImage(data: data)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Delegates
    // MARK: Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 1:
            var infoCell: InfoTableViewCell! = tableView.dequeueReusableCellWithIdentifier("InfoTableViewCell") as? InfoTableViewCell
            
            if infoCell == nil {
                infoCell = InfoTableViewCell.info()
            }
            
            infoCell.userImageView.image = self.imageUser
            infoCell.userTitleLabel.text = "Pseudo"
            
            cell = infoCell
            
            break
            
        case 2:
            var moreButtonCell: MoreTableViewCell! = tableView.dequeueReusableCellWithIdentifier("MoreTableViewCell") as? MoreTableViewCell
            
            if moreButtonCell == nil {
                moreButtonCell = MoreTableViewCell.moreCell()
            }
            
            moreButtonCell.moreButton.setTitle("Modifier mon profil", forState: .Normal)
            moreButtonCell.delegate = self
            
            cell = moreButtonCell
            
        case 3:
            var horizontalScrollCell: HorizontalScrollTableViewCell! = tableView.dequeueReusableCellWithIdentifier("HorizontalScrollTableViewCell") as? HorizontalScrollTableViewCell
            
            if horizontalScrollCell == nil {
                horizontalScrollCell = HorizontalScrollTableViewCell.horizontalScroll()
            }
            
            horizontalScrollCell.titleLabel.text = "Plats en cours"
            
            cell = horizontalScrollCell
            
            break
            
        case 4:
            var horizontalScrollCell: HorizontalScrollTableViewCell! = tableView.dequeueReusableCellWithIdentifier("HorizontalScrollTableViewCell") as? HorizontalScrollTableViewCell
            
            if horizontalScrollCell == nil {
                horizontalScrollCell = HorizontalScrollTableViewCell.horizontalScroll()
            }
            
            horizontalScrollCell.titleLabel.text = "Recettes déposées"
            
            cell = horizontalScrollCell
            
            break
            
        case 5:
            var horizontalScrollCell: HorizontalScrollTableViewCell! = tableView.dequeueReusableCellWithIdentifier("HorizontalScrollTableViewCell") as? HorizontalScrollTableViewCell
            
            if horizontalScrollCell == nil {
                horizontalScrollCell = HorizontalScrollTableViewCell.horizontalScroll()
            }
            
            horizontalScrollCell.titleLabel.text = "Anciens plats"
            
            cell = horizontalScrollCell
            
            break
            
        default:
            break
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.contentView.backgroundColor = UIColor.clearColor()
        if (cell is HorizontalScrollTableViewCell) {
            let similarMovieCell: HorizontalScrollTableViewCell = (cell as! HorizontalScrollTableViewCell)
            similarMovieCell.setCollectionViewDataSourceDelegate(self, index: indexPath.row)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height: CGFloat = 0.0
        
        switch indexPath.row {
        case 0:
            height = 0
            break
            
        case 1:
            height = 56
            break
            
        case 2:
            height = 62
            break
            
        case 3, 4, 5:
            height = 140
            break
            
        default:
            height = 100
            break
        }
        
        return height
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if let imageCell = self.scrollingHeaderView.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as? ImageTableViewCell {
            imageCell.scrollViewDidScroll(scrollView)
        }
        
        if !isRowVisible() {
            UIView.animateWithDuration(0.2, animations: {() -> Void in
                self.navBar.alpha = 1
                UIApplication.sharedApplication().statusBarHidden = false
                }, completion: nil)
        } else {
            UIView.animateWithDuration(0.2, animations: {() -> Void in
                self.navBar.alpha = 0
                UIApplication.sharedApplication().statusBarHidden = true
                }, completion: nil)
        }
        
        var fixedButtonFrame = self.buttonBack.frame
        fixedButtonFrame.origin.y = 31 + scrollView.contentOffset.y
        self.buttonBack.frame = fixedButtonFrame
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = event?.allTouches()?.first
        let touchLocation = touch?.locationInView(self.view)
        
        if CGRectContainsPoint(self.view.frame, touchLocation!) {
            self.dragging = true
            self.oldX = (touchLocation?.x)!
            self.oldY = (touchLocation?.y)!
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(0.25, delay: 0.0, options: ([.BeginFromCurrentState, .CurveEaseInOut]), animations: {() -> Void in
            self.blackImageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
            }, completion: { _ in })
        
        let touch = event?.allTouches()?.first
        let touchLocation = touch?.locationInView(self.view)
        
        if dragging {
            let imageView = self.blackImageView.subviews.first as! UIImageView
            
            var frame = self.view.frame
            
            self.endX = self.view.frame.origin.x + (touchLocation?.x)! - oldX
            self.endY = self.view.frame.origin.y + (touchLocation?.y)! - oldY
            
            frame.origin.x = self.endX
            frame.origin.y = self.endY
            
            imageView.frame = frame
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.dragging = false
        
        let imageView = self.blackImageView.subviews.first as! UIImageView
        
        if imageView.center.x <= -75 || imageView.center.x >= 450 || imageView.center.y <= 150 || imageView.center.y >= 550 {
            self.blackImageView.subviews.first?.superview?.removeFromSuperview()
        } else {
            UIView.animateWithDuration(0.25, delay: 0.0, options: ([.BeginFromCurrentState, .CurveEaseInOut]), animations: {() -> Void in
                self.blackImageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                self.blackImageView.subviews.first?.frame = self.view.frame
                }, completion: { _ in })
        }
    }
    
    
    // MARK: - Personnal Delegates
    // MARK: Delegates KMScrollingHeaderViewDelegate
    func detailsPage(scrollingHeaderView: KMScrollingHeaderView!, headerImageView imageView: UIImageView!) {
        dispatch_async(dispatch_get_main_queue(),{
            imageView.image = self.imageUser
            imageView.contentMode = .ScaleAspectFit
            
        })
    }
    
    // MARK: Delegates CollectionView
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: HorizontalScrollCollectionViewCell = (collectionView.dequeueReusableCellWithReuseIdentifier("HorizontalScrollCollectionViewCell", forIndexPath: indexPath) as! HorizontalScrollCollectionViewCell)
        
        
        cell.imageImageView.image = self.images[indexPath.row]
        cell.nameLabel.text = "Burger"
        return cell
    }
    
    // MARK: Delegates ParallaxDetailsViewProtocol
    func favoriteAuthorButtonTapped(button: UIButton) {
    }
    
    func reserveButtonTapped(button: UIButton) {
    }
    
    func moreButtonTapped(button: UIButton) {
    }
    
    func theMoreButtonTapped(button: UIButton) {
        let alertController = UIAlertController(title: "Modification du profil", message:
            "// TODO \nChamps de modifications du profil !", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Modifier", style: .Default,handler: nil))
        alertController.addAction(UIAlertAction(title: "Annuler", style: .Cancel,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func imagePager(imagePager: KIImagePager, didSelectImage image: UIImage) {
    }
    
    func pickerViewUpdateLabel(button: UIButton, text: String) {
    }
    
    func cellSelected(button: UIButton) {
        
    }
    
    
    // MARK: - Personnal Methods
    func setupDetailsPageView() {
        self.scrollingHeaderView.tableView.dataSource = self
        self.scrollingHeaderView.tableView.delegate = self
        self.scrollingHeaderView.delegate = self
        self.scrollingHeaderView.tableView.separatorColor = UIColor.clearColor()
        self.scrollingHeaderView.headerImageViewContentMode = .Top
        
        self.scrollingHeaderView.reloadScrollingHeader()
    }
    
    func setupNavbarButtons() {
        let buttonBack = UIButton(type: .Custom)
        
        buttonBack.frame = CGRectMake(10, 31, 22, 22)
        buttonBack.setImage(UIImage(named: "back_icon"), forState: UIControlState.Normal)
        buttonBack.addTarget(self, action: #selector(SecondDetailsParallaxViewController.backButton), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(buttonBack)
        
        self.navBarTitleLabel.text = "Pseudo"
    }
    
    func isRowVisible() -> Bool {
        guard let indexes = self.scrollingHeaderView.tableView.indexPathsForVisibleRows else {
            return false
        }
        
        for index in indexes {
            if index.row == 0 {
                return true
            }
        }
        
        return false
    }
    
    func backButton() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func dismissFullScreenMode(sender: UITapGestureRecognizer) {
        sender.view?.superview?.removeFromSuperview()
    }
}
