//
//  TestViewController.swift
//  DetailsParallaxView
//
//  Created by Pierre on 30/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class DetailsParallaxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ParallaxDetailsViewDelegate, KMScrollingHeaderViewDelegate {
    
    @IBOutlet var scrollingHeaderView: KMScrollingHeaderView!
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var navBarTitleLabel: UILabel!
    
    let buttonBack = UIButton(type: .Custom)
    var statusBarHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavbarButtons()
        self.setupDetailsPageView()
        self.navBar.alpha = 0
        UIApplication.sharedApplication().statusBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
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
        buttonBack.addTarget(self, action: #selector(ParallaxDetailsTableViewController.backButton), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(buttonBack)
        
        self.navBarTitleLabel.text = "Burger"
    }
    
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        var cell = UITableViewCell()
        
        // Configure the cell...
        switch indexPath.row {
        case 1:
            var infoDetailsCell: InfoDetailsTableViewCell! = tableView.dequeueReusableCellWithIdentifier("InfoDetailsTableViewCell") as? InfoDetailsTableViewCell
            
            if infoDetailsCell == nil {
                infoDetailsCell = InfoDetailsTableViewCell.infoDetails()
            }
            
            if let url = NSURL(string: "https://lh4.googleusercontent.com/-yvDZHxTUzZg/AAAAAAAAAAI/AAAAAAAAAAA/AMW9IgfPYUvVK7Q5sjWLob8pxqXyeJMTMQ/s96-c-mo/photo.jpg"), data = NSData(contentsOfURL: url) {
                infoDetailsCell.authorImageView.image = UIImage(data: data)
            }
            infoDetailsCell.titleLabel.text = "Re Test"
            infoDetailsCell.authorLabel.text = "Re Test2"
            
            infoDetailsCell.delegate = self
            
            cell = infoDetailsCell
            
            break
            
        case 2:
            var descriptionCell: DescriptionTableViewCell! = tableView.dequeueReusableCellWithIdentifier("DescriptionTableViewCell") as? DescriptionTableViewCell
            
            if descriptionCell == nil {
                descriptionCell = DescriptionTableViewCell.descriptionCell()
            }
            
            descriptionCell.descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dictum neque ante, sed euismod ipsum aliquam et. Proin erat nulla, auctor eget convallis scelerisque, pulvinar eu tellus. Vestibulum molestie in turpis vitae convallis. Nunc tincidunt sapien non elit luctus, porta scelerisque erat mollis. Integer rutrum elit ut diam maximus venenatis. Duis sollicitudin lectus in lacus venenatis suscipit. Nam pharetra eu nisi quis consequat. Curabitur ultricies purus et risus blandit, a faucibus leo scelerisque. Phasellus et eleifend nisl."
            cell = descriptionCell
            
            break
            
        case 3:
            var conseilsCell: ConseilsTableViewCell! = tableView.dequeueReusableCellWithIdentifier("ConseilsTableViewCell") as? ConseilsTableViewCell
            
            if conseilsCell == nil {
                conseilsCell = ConseilsTableViewCell.conseilsCell()
            }
            
            conseilsCell.conseilsLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dictum neque ante, sed euismod ipsum aliquam et. Proin erat nulla, auctor eget convallis scelerisque, pulvinar eu tellus. Vestibulum molestie in turpis vitae convallis. Nunc tincidunt sapien non elit luctus, porta scelerisque erat mollis. Integer rutrum elit ut diam maximus venenatis. Duis sollicitudin lectus in lacus venenatis suscipit. Nam pharetra eu nisi quis consequat. Curabitur ultricies purus et risus blandit, a faucibus leo scelerisque. Phasellus et eleifend nisl."
            cell = conseilsCell
            
            break
            
        case 4:
            var ratingCell: RatingTableViewCell! = tableView.dequeueReusableCellWithIdentifier("RatingTableViewCell") as? RatingTableViewCell
            
            if ratingCell == nil {
                ratingCell = RatingTableViewCell.ratingCell()
            }
            
            ratingCell.noteLabel.text = "4"
            ratingCell.countLabel.text = "125 votes"
            ratingCell.distanceLabel.text = "250 m"
            
            cell = ratingCell
            
            break
            
        case 5:
            var moreCell: MoreTableViewCell! = tableView.dequeueReusableCellWithIdentifier("MoreTableViewCell") as? MoreTableViewCell
            
            if moreCell == nil {
                moreCell = MoreTableViewCell.moreCell()
            }
            
            moreCell.delegate = self
            cell = moreCell
            
            break
            
        case 6:
            var moreImagesCell: MoreImagesTableViewCell! = tableView.dequeueReusableCellWithIdentifier("MoreImagesTableViewCell") as? MoreImagesTableViewCell
            
            if moreImagesCell == nil {
                moreImagesCell = MoreImagesTableViewCell.moreImagesCell()
            }
            
            moreImagesCell.images = ["http://www.blog.marche-prive.com/wp-content/uploads/2015/04/food58-burger-two-bleu-bacon.jpg",
                                     "http://img1.gtsstatic.com/wallpapers/9b04890a3b057f005949ee85b16fc931_large.jpeg"]
            moreImagesCell.imagePager.reloadData()
            
            moreImagesCell.delegate = self
            
            cell = moreImagesCell
            
            break
            
        default:
            break
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height: CGFloat = 0.0
        
        switch indexPath.row {
        case 0:
            height = 0
            break
            
        case 1:
            height = 104
            break
            
        case 2,3:
            height = 250
            break
            
        case 4:
            height = 60
            break
            
        case 5:
            height = 62
            break
            
        case 6:
            height = 250
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
    
    func detailsPage(scrollingHeaderView: KMScrollingHeaderView!, headerImageView imageView: UIImageView!) {
        if let url = NSURL(string: "http://www.blog.marche-prive.com/wp-content/uploads/2015/04/food58-burger-two-bleu-bacon.jpg"), data = NSData(contentsOfURL: url) {
            imageView.image = UIImage(data: data)
            imageView.contentMode = .ScaleAspectFit
        }
    }
    
    // MARK: - Delegates ParallaxDetailsViewProtocol
    func favoriteAuthorButtonTapped(button: UIButton) {
        print("Auteur en favoris")
    }
    
    func reserveButtonTapped(button: UIButton) {
        print("Reservé")
    }
    
    func moreButtonTapped(button: UIButton) {
        print("Bouton Plus")
    }
    
    func theMoreButtonTapped(button: UIButton) {
        print("Bouton Voir ses recettes !")
    }
    
    func isRowVisible() -> Bool {
        guard let indexes = self.scrollingHeaderView.tableView.indexPathsForVisibleRows else {
            return false
        }
        
        for index in indexes {
            if index.row == 0 {
                return true
            }
            
            /*print(self.scrollingHeaderView.tableView.rectForRowAtIndexPath(index).origin.y)
            
            if self.scrollingHeaderView.tableView.rectForRowAtIndexPath(index).origin.y <= 280 {
                return true
            }*/
        }
        
        return false
    }
    
    func backButton() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func imagePager(imagePager: KIImagePager, didSelectImage image: String) {
        if let url = NSURL(string: image), data = NSData(contentsOfURL: url) {
            let newImageView = UIImageView(image: UIImage(data: data))
            newImageView.frame = self.view.frame
            newImageView.backgroundColor = .blackColor()
            newImageView.contentMode = .ScaleAspectFit
            newImageView.userInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(DetailsParallaxViewController.dismissFullscreenImage(_:)))
            newImageView.addGestureRecognizer(tap)
            self.view.addSubview(newImageView)
        }
    }
    
    func dismissFullscreenImage(sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
}
