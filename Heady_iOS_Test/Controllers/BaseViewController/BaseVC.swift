//
//  BaseVC.swift
//  KapuGems
//
//  Created by Monish Painter on 23/05/18.
//  Copyright © 2018 Qwesys Digital Solutions. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import FontAwesome_swift

class BaseVC: UIViewController , UIGestureRecognizerDelegate , NVActivityIndicatorViewable{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -
    //MARK: NavigationBar set
    func setNavigationbarleft_imagename(left_imagename: String,
                                        left_icon_Name: FontAwesome?,
                                        left_action: Selector?,
                                        right_imagename: String,
                                        right_icon_Name: FontAwesome?,
                                        right_action: Selector?,
                                        title: String,
                                        withThemeImageName: String) {
        
        self.navigationController?.setNavigationBarHidden (false, animated: false)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.barTintColor = APP_WHITE_COLOR
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        
        if (left_imagename.count != 0 || left_icon_Name != nil)
        {
            let btnleft: UIButton = UIButton(frame: CGRect(x: -5, y: 0, width: 35, height: 35))
            btnleft.layer.cornerRadius = btnleft.frame.width/2
            btnleft.setTitleColor(APP_THEME_COLOR, for: .normal)
            
            //  btnleft.backgroundColor = APP_BLACK_COLOR
            
            if left_icon_Name != nil {
                btnleft.titleLabel!.numberOfLines = 0
                btnleft.titleLabel!.textAlignment = .left
                
                btnleft.titleLabel?.font = UIFont.fontAwesome(ofSize: 30, style: .brands)
                btnleft.titleLabel?.textColor = UIColor.black
                btnleft.setTitle(String.fontAwesomeIcon(name: left_icon_Name!), for: .normal)
                
            }
            else {
                btnleft.setImage(UIImage(named:left_imagename), for: .normal)
            }
            btnleft.addTarget(self, action: left_action!, for: .touchDown)
            
            let backBarButon: UIBarButtonItem = UIBarButtonItem(customView: btnleft)
            self.navigationItem.setLeftBarButton(backBarButon, animated: false)
        }
        else
        {
            self.navigationItem.hidesBackButton = true;
            self.navigationItem.leftBarButtonItem = nil;
        }
        
        if (right_imagename.count != 0 || right_icon_Name != nil)
        {
            let btnright: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
            btnright.layer.cornerRadius = btnright.frame.width/2
            btnright.setTitleColor(APP_THEME_COLOR, for: .normal)
            
            if right_icon_Name != nil {
                btnright.titleLabel!.numberOfLines = 0
                btnright.titleLabel!.textAlignment = .left
                btnright.titleLabel?.font = UIFont.fontAwesome(ofSize: 30, style: .brands)
                btnright.titleLabel?.textColor = UIColor.black
                btnright.setTitle(String.fontAwesomeIcon(name: right_icon_Name!), for: .normal)
            }
            else {
                btnright.setImage(UIImage(named:right_imagename), for: .normal)
            }
            
            
            btnright.addTarget(self, action: right_action!, for: .touchDown)
            
            let backBarButon: UIBarButtonItem = UIBarButtonItem(customView: btnright)
            self.navigationItem.setRightBarButton(backBarButon, animated: false)
        }
        else
        {
            self.navigationItem.rightBarButtonItem = nil;
        }
        
        if title.count > 0 {
            
            let lblValues: UILabel = UILabel()
            //lblValues.text = title.uppercased()
            lblValues.text = title
            lblValues.clipsToBounds = false
            lblValues.backgroundColor = UIColor.clear
            lblValues.textColor = APP_THEME_COLOR
            lblValues.sizeToFit()
            lblValues.tag = 1212
            lblValues.textAlignment = .center;
            lblValues.font = UIFont.systemFont(ofSize: 16)
            self.navigationItem.titleView = lblValues
        }
        
        if withThemeImageName.count > 0{
            
            let titleImage:UIImage = UIImage(named: withThemeImageName)!
            let titleView:UIImageView = UIImageView(image: titleImage)
            titleView.frame = CGRect(x: 0, y: 0, width: 150, height: 40)
            self.navigationItem.titleView = titleView
        }
        
    }

    
    @IBAction func btnBackHandle(_ sender: Any) {
        self.view.endEditing(true)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Loader Methods
    func createMainLoaderInView(message : String) {
        DispatchQueue.main.async(execute: {
            let size = CGSize(width: isIpad() ? 60 : 40, height: isIpad() ? 60 : 40)
            self.startAnimating(size, message: message, type: .ballSpinFadeLoader)//ballClipRotatePulse
        })
    }
    
    
    func stopLoaderAnimation(vc : UIViewController) {
        DispatchQueue.main.async(execute: {
            self.stopAnimating()
        })
    }
}
