//
//  ParallaxDetailsTableViewController.swift
//  DetailsParallaxView
//
//  Created by Pierre on 26/03/2016.
//  Copyright © 2016 Pierre. All rights reserved.
//

import UIKit

class ParallaxDetailsTableViewController: UITableViewController, ParallaxDetailsViewDelegate {
    
    let buttonBack = UIButton(type: .Custom)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.separatorStyle = .None
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 26.0/255.0, green: 166.0/255.0, blue: 131.0/255.0, alpha: 1)
        self.title = "Burger"
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        
        self.buttonBack.frame = CGRectMake(17, 31, 22, 22)
        self.buttonBack.setImage(UIImage(named: "back_icon"), forState: .Normal)
        self.buttonBack.addTarget(self, action: #selector(ParallaxDetailsTableViewController.backButton), forControlEvents: .TouchUpInside)
        self.view.addSubview(self.buttonBack)
        
        let btnName = UIButton()
        btnName.setImage(UIImage(named: "back_icon"), forState: .Normal)
        btnName.frame = CGRectMake(0, 0, 22, 22)
        btnName.addTarget(self, action: #selector(ParallaxDetailsTableViewController.backButton), forControlEvents: .TouchUpInside)
        
        //.... Set Right/Left Bar Button item
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = btnName
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        } else {
            return 6
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        var cell = UITableViewCell()

        // Configure the cell...
        switch indexPath.section {
        case 0:
            var imageCell: ImageTableViewCell! = tableView.dequeueReusableCellWithIdentifier("ImageCell") as? ImageTableViewCell
            
            if imageCell == nil {
                imageCell = ImageTableViewCell.imageCell()
            }
            
            if let url = NSURL(string: "http://www.blog.marche-prive.com/wp-content/uploads/2015/04/food58-burger-two-bleu-bacon.jpg"), data = NSData(contentsOfURL: url) {
                imageCell.principalImageView.image = UIImage(data: data)
            }
            
            cell = imageCell
            
            break
            
        default:
            switch indexPath.row {
            case 0:
                var infoDetailsCell: InfoDetailsTableViewCell! = tableView.dequeueReusableCellWithIdentifier("InfoDetailsTableViewCell") as? InfoDetailsTableViewCell
                
                if infoDetailsCell == nil {
                    infoDetailsCell = InfoDetailsTableViewCell.infoDetails()
                }
                
                if let url = NSURL(string: "https://lh4.googleusercontent.com/-yvDZHxTUzZg/AAAAAAAAAAI/AAAAAAAAAAA/AMW9IgfPYUvVK7Q5sjWLob8pxqXyeJMTMQ/s96-c-mo/photo.jpg"), data = NSData(contentsOfURL: url) {
                    infoDetailsCell.authorImageView.image = UIImage(data: data)
                }
                infoDetailsCell.titleLabel.text = "Test"
                infoDetailsCell.authorLabel.text = "Re Test"
                
                infoDetailsCell.delegate = self
                
                cell = infoDetailsCell
                
                break
                
            case 1:
                var descriptionCell: DescriptionTableViewCell! = tableView.dequeueReusableCellWithIdentifier("DescriptionTableViewCell") as? DescriptionTableViewCell
                
                if descriptionCell == nil {
                    descriptionCell = DescriptionTableViewCell.descriptionCell()
                }
                
                descriptionCell.descriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dictum neque ante, sed euismod ipsum aliquam et. Proin erat nulla, auctor eget convallis scelerisque, pulvinar eu tellus. Vestibulum molestie in turpis vitae convallis. Nunc tincidunt sapien non elit luctus, porta scelerisque erat mollis. Integer rutrum elit ut diam maximus venenatis. Duis sollicitudin lectus in lacus venenatis suscipit. Nam pharetra eu nisi quis consequat. Curabitur ultricies purus et risus blandit, a faucibus leo scelerisque. Phasellus et eleifend nisl."
                cell = descriptionCell
                
                break
                
            case 2:
                var conseilsCell: ConseilsTableViewCell! = tableView.dequeueReusableCellWithIdentifier("ConseilsTableViewCell") as? ConseilsTableViewCell
                
                if conseilsCell == nil {
                    conseilsCell = ConseilsTableViewCell.conseilsCell()
                }
                
                conseilsCell.conseilsLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dictum neque ante, sed euismod ipsum aliquam et. Proin erat nulla, auctor eget convallis scelerisque, pulvinar eu tellus. Vestibulum molestie in turpis vitae convallis. Nunc tincidunt sapien non elit luctus, porta scelerisque erat mollis. Integer rutrum elit ut diam maximus venenatis. Duis sollicitudin lectus in lacus venenatis suscipit. Nam pharetra eu nisi quis consequat. Curabitur ultricies purus et risus blandit, a faucibus leo scelerisque. Phasellus et eleifend nisl."
                cell = conseilsCell
                
                break
                
            case 3:
                var ratingCell: RatingTableViewCell! = tableView.dequeueReusableCellWithIdentifier("RatingTableViewCell") as? RatingTableViewCell
                
                if ratingCell == nil {
                    ratingCell = RatingTableViewCell.ratingCell()
                }
                
                ratingCell.noteLabel.text = "4"
                ratingCell.countLabel.text = "125 votes"
                ratingCell.distanceLabel.text = "250 m"
                
                cell = ratingCell
                
                break
                
            case 4:
                var moreCell: MoreTableViewCell! = tableView.dequeueReusableCellWithIdentifier("MoreTableViewCell") as? MoreTableViewCell
                
                if moreCell == nil {
                    moreCell = MoreTableViewCell.moreCell()
                }
                
                moreCell.delegate = self
                cell = moreCell
                
                break
                
            case 5:
                var moreImagesCell: MoreImagesTableViewCell! = tableView.dequeueReusableCellWithIdentifier("MoreImagesTableViewCell") as? MoreImagesTableViewCell
                
                if moreImagesCell == nil {
                    moreImagesCell = MoreImagesTableViewCell.moreImagesCell()
                }
                
                moreImagesCell.images = ["http://www.blog.marche-prive.com/wp-content/uploads/2015/04/food58-burger-two-bleu-bacon.jpg",
                                         "http://img1.gtsstatic.com/wallpapers/9b04890a3b057f005949ee85b16fc931_large.jpeg"]
                moreImagesCell.imagePager.reloadData()
                
                cell = moreImagesCell
                
                break
                
            default:
                print("Nothing")
            }
        }
        

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height: CGFloat = 0.0
        
        switch indexPath.section {
        case 0:
            return UITableViewAutomaticDimension
        default:
            switch indexPath.row {
            case 0:
                height = 104
                break
                
            case 1,2:
                height = 250
                break
                
            case 3:
                height = 60
                break
                
            case 4:
                height = 62
                break
                
            case 5:
                height = 250
                break
                
            default:
                height = 100
                break
            }
        }
        
        return height
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if let imageCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as? ImageTableViewCell {
            imageCell.scrollViewDidScroll(scrollView)
        }
        
        if !isRowVisible() {
            self.navigationController?.navigationBarHidden = false
        } else {
            self.navigationController?.navigationBarHidden = true
        }
        
        var fixedButtonFrame = self.buttonBack.frame
        fixedButtonFrame.origin.y = 31 + scrollView.contentOffset.y
        self.buttonBack.frame = fixedButtonFrame
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
        let indexes: NSArray = tableView.indexPathsForVisibleRows!
        for index in indexes {
            if index.row == 0 && index.section == 0 {
                return true
            }
        }
        
        return false
    }
    
    func backButton() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}