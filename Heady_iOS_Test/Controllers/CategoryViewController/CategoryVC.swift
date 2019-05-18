//
//  CategoryVC.swift
//  Heady_iOS_Test
//
//  Created by Monish Painter on 17/05/19.
//  Copyright © 2019 Monish Painter. All rights reserved.
//

import UIKit

class CategoryVC: BaseVC {

    @IBOutlet weak var tblCategory: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.getCategory()
    }
    
    // MARK: - Get Category
    private func getCategory(){
        if isConnectedToNetwork() {
            let refreshURL = WebServicePrefix.GetWSUrl(serviceType: .GetCategories)
            HttpRequestManager.sharedInstance.getRequestWithoutParams(endpointurl: refreshURL) { (responseDic, error, message) in
                self.stopLoaderAnimation(vc: self)
                if responseDic != nil {
                    guard let cateArray : [[String : Any]] = responseDic?["categories"] as? [[String : Any]] else {
                        showAlertWithTitleWithMessage(message: SOMETHING_WRONG)
                        return
                    }
                    for dicAtrStruct in cateArray {
                        DBManager.sharedInstance.addAllObjectsFormDic(Categories.self, value: dicAtrStruct, update: true)
                    }
                    
                    if let rankArray = responseDic?["rankings"] as? [[String : Any]] {
                        for dicRank in rankArray {
                            DBManager.sharedInstance.addAllObjectsFormDic(Rankings.self, value: dicRank, update: true)
                        }
                    }
                    
                }
                else{
                    if let mesg = message {
                        showAlertWithTitleWithMessage(message: mesg)
                    }
                    else{
                        showAlertWithTitleWithMessage(message: SOMETHING_WRONG)
                    }
                }
            }
        }
        else{
            showNoInternetMAlert()
        }
    }


}
