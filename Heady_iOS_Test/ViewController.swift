//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Monish Painter on 24/07/19.
//  Copyright © 2019 Monish Painter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableViewMenu: UITableView!
    var arrMainMenu = ["abc","xyz","mno"]
    @IBOutlet weak var collectionVW: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewMenu.tableFooterView = UIView()
        self.tableViewMenu.dataSource = self
        self.tableViewMenu.delegate = self
        tableViewMenu.rowHeight = UITableView.automaticDimension
        
        
        
        let spacingCell : CGFloat = 10.0
        let widthCell : CGFloat = (768 - spacingCell*3)/2
        let collectionViewLayout: UICollectionViewFlowLayout = (collectionVW!.collectionViewLayout as! UICollectionViewFlowLayout)
        collectionViewLayout.sectionInset = UIEdgeInsets(top: spacingCell, left: spacingCell, bottom: spacingCell, right: spacingCell)
        collectionViewLayout.minimumInteritemSpacing = spacingCell
        collectionViewLayout.itemSize = CGSize(width: widthCell, height: ((widthCell-8)*1.38) + 45)
        collectionViewLayout.scrollDirection = .vertical
        
        collectionVW.showsHorizontalScrollIndicator = false
        collectionVW.showsVerticalScrollIndicator = false
        
        collectionVW.register(UINib.init(nibName: "WhishListCell", bundle: nil), forCellWithReuseIdentifier: "CellWhishList")

    }


}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*      let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let viewControllerB = storyBoard.instantiateViewControllerWithIdentifier("nextView") as! ViewControllerB
         self.presentViewController(viewControllerB, animated:true, completion:nil)
         */
    }

}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMainMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : TableViewCellMenu? = tableView.dequeueReusableCell(withIdentifier: "MenuHeaderTableViewCell") as? TableViewCellMenu
        if cell == nil {
            tableView.register(UINib.init(nibName: "TableViewCellMenu", bundle: nil), forCellReuseIdentifier: "TableViewCellMenu")
            let arrNib : Array = Bundle.main.loadNibNamed("TableViewCellMenu", owner: self, options: nil)!
            cell = arrNib[0] as? TableViewCellMenu
        }
        cell?.lblText.text = arrMainMenu[indexPath.row]
        cell?.backgroundColor = UIColor .clear
        cell?.contentView.backgroundColor = UIColor .clear
        cell?.selectionStyle = .none
        return cell!

    }
    
    
}

extension ViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMainMenu.count

    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellWhishList",for:indexPath) as! CollectionViewCell
        return UICollectionViewCell()
    }
    
    
}
