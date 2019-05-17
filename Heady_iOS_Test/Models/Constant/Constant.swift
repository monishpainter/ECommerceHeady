//
//  constant.swift
//  Heady_iOS_Test
//
//  Created by Monish Painter on 17/05/19.
//  Copyright © 2019 Monish Painter. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration
import NVActivityIndicatorView

//MARK:
//MARK: Application related variables

let APP_CONTEXT = UIApplication.shared.delegate as! AppDelegate
public let APP_NAME: String = Bundle.main.infoDictionary!["CFBundleName"] as! String
public let APP_VERSION: String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String

//MARK:- Storyboard name
public let storyboardMain :String = "Main"
public let storyboardLogin :String = "Login"

//MARK: VC ID
public let viewCategoriesListVC = "idCategoriesListVC"


//MARK:  Get VC for navigation

public func getStoryboard(storyboardName: String) -> UIStoryboard {
    return UIStoryboard(name: "\(storyboardName)\(isIpad() ? "_iPad" : "_iPhone")", bundle: nil)
}

public func loadVC(_ strStoryboardId: String, _ strVCId: String) -> UIViewController {
    let vc = getStoryboard(storyboardName: strStoryboardId).instantiateViewController(withIdentifier: strVCId)
    return vc
}

//MARK: - Check Device is iPad or not

public func isIpad( ) ->Bool{
    switch UIDevice.current.userInterfaceIdiom {
    case .phone:
        return false
    case .pad:
        return true
    case .unspecified:
        return false
        
    default :
        return false
    }
}


//MARK: - Network indicator

public func ShowNetworkIndicator(xx :Bool)
{
    UIApplication.shared.isNetworkActivityIndicatorVisible = xx
}
func showNoInternetMAlert()  {
    DispatchQueue.main.async(execute: {
        let _ = MONAlertController.alert(title: ALERT_NAME, message: "No intermet connection available. Please try again!")
    })
}




//MARK: - Color functions

public func COLOR_CUSTOM(_ Red: Float, _ Green: Float , _ Blue: Float, _ Alpha: Float) -> UIColor {
    return  UIColor (red:  CGFloat(Red)/255.0, green: CGFloat(Green)/255.0, blue: CGFloat(Blue)/255.0, alpha: CGFloat(Alpha))
}

public func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

public func randomColor(_ alpha : CGFloat = 1.0) -> UIColor {
    let r: UInt32 = arc4random_uniform(255)
    let g: UInt32 = arc4random_uniform(255)
    let b: UInt32 = arc4random_uniform(255)
    
    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
}

public let APP_THEME_COLOR :UIColor = COLOR_CUSTOM(10,10,10,1)

public let APP_WHITE_COLOR :UIColor = COLOR_CUSTOM(250,250,250,1)
public let APP_BLACK_COLOR :UIColor = COLOR_CUSTOM(52, 42, 61,1)
public let APP_LIGHT_GREY_COLOR :UIColor = COLOR_CUSTOM(197, 197, 197,1)

//MARK:- Log trace

public func DLog<T>(_ message:T,  file: String = #file, function: String = #function, lineNumber: Int = #line ) {
    #if DEBUG
        if let text = message as? String {
            
            print("\((file as NSString).lastPathComponent) -> \(function) line: \(lineNumber): \(text)")
        }
    #endif
}





//MARK: - Loader
public func createSmallLoaderInView() -> NVActivityIndicatorView {
    let loaderSize : CGFloat = 40.0
    let frame = CGRect(x: 0, y: 0, width: loaderSize, height: loaderSize)
    let activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                        type: .ballClipRotatePulse)
    activityIndicatorView.color = APP_THEME_COLOR
    return activityIndicatorView
}



//MARK: - Check Internet connection

func isConnectedToNetwork() -> Bool {
    
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    
    guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
        
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
            
            SCNetworkReachabilityCreateWithAddress(nil, $0)
        }
        
    }) else {
        
        return false
    }
    
    var flags : SCNetworkReachabilityFlags = []
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
        return false
    }
    
    let isReachable = flags.contains(.reachable)
    let needsConnection = flags.contains(.connectionRequired)
    
    if !(isReachable && !needsConnection){

    }
    
    return (isReachable && !needsConnection)
    
}

