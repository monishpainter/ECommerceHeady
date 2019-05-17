//
//  Heady_iOS_Test
//
//  Created by Monish Painter on 17/05/19.
//  Copyright © 2019 Monish Painter. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
import NVActivityIndicatorView

private let kPlaceholderRightPadding : CGFloat = 10.0
private let kPlaceholderLeftPadding : CGFloat = 10.0
private let kPlaceholderTopPadding : CGFloat = 10.0
private let kPlaceholderBottomPadding : CGFloat = 10.0


public extension UITableView {
    
    func reloadData(withPlaceholderString placeholderString: String) {
        backgroundView = nil
        if numberOfSections == 0 || (numberOfRows(inSection: 0) == 0 || numberOfRows(inSection: 0) == NSNotFound) {
            if (placeholderString.count ) > 0 {
                let lblEmpty: UILabel? = getLabel()
                lblEmpty?.text = placeholderString
                backgroundView = lblEmpty
            }
        }
        else {
            backgroundView = nil
        }
        reloadData()
    }
    
    func reloadDataWithLoader(_ isLoader : Bool) {
        DispatchQueue.main.async(execute: {
            let loader : NVActivityIndicatorView  = createSmallLoaderInView()
            if self.numberOfSections == 0 || (self.numberOfRows(inSection: 0) == 0 || self.numberOfRows(inSection: 0) == NSNotFound) {
                if isLoader {
                    let viewAdd = UIView(frame: CGRect(x: kPlaceholderLeftPadding, y: kPlaceholderTopPadding, width: self.frame.width - kPlaceholderRightPadding - kPlaceholderLeftPadding, height: self.frame.height - kPlaceholderBottomPadding))
                    loader.startAnimating()
                    loader.center = viewAdd.center
                    viewAdd.addSubview(loader)
                    self.backgroundView = viewAdd
                }
                else {
                    loader.stopAnimating()
                    self.backgroundView = nil
                }
            }
            else {
                loader.stopAnimating()
                self.backgroundView = nil
            }
            self.reloadData()
        })
    }
    
    
    func getLabel() -> UILabel {
        let lblEmpty = UILabel(frame: CGRect(x: kPlaceholderLeftPadding, y: kPlaceholderTopPadding, width: self.frame.width - kPlaceholderRightPadding - kPlaceholderLeftPadding, height: frame.height - kPlaceholderBottomPadding))
        lblEmpty.numberOfLines = 3
        lblEmpty.textAlignment = .center
        lblEmpty.lineBreakMode = NSLineBreakMode.byWordWrapping
        lblEmpty.sizeThatFits(lblEmpty.frame.size)
        return lblEmpty
    }
    
}
