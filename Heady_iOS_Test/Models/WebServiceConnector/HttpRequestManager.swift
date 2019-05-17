//
//  Heady_iOS_Test
//
//  Created by Monish Painter on 17/05/19.
//  Copyright © 2019 Monish Painter. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

class HttpRequestManager {
    
    static let sharedInstance = HttpRequestManager()
    
    var responseObjectDic : Dictionary<String, AnyObject>?
    var URLString : String!
    var Message : String!
    
    private static var Manager: Alamofire.SessionManager = {
        
        // Create the server trust policies
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            WebServicePrefix.Server_URL: .disableEvaluation
        ]
        
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        manager.session.configuration.timeoutIntervalForRequest = 90
        return manager
    }()
    
    
    //MARK:- GET Request1
    func getRequestWithoutParams(endpointurl:String,responseData:@escaping (_ data:Dictionary<String, AnyObject>?,_ error:NSError?,_ message:String)  -> Void)
    {
        DLog( "URL : \(endpointurl)")
        ShowNetworkIndicator(xx: true)
        HttpRequestManager.Manager.request(endpointurl, method : .get)
            .responseJSON { response in
                ShowNetworkIndicator(xx: false)
                
                DLog(response.request)  // original URL request
                DLog(response.response) // URL response
                DLog(response.data)     // server data
                DLog(response.result)   // result of response serialization
                if let _ = response.result.error
                {
                    responseData(nil, response.result.error as NSError?, SOMETHING_WRONG)
                }
                else
                {
                    switch response.result {
                        
                    case .success(_):
                        
                        guard let responseJSON:NSDictionary = response.result.value as? NSDictionary else {
                            print("Invalid tag information received from the service")
                            responseData(nil, nil, SOMETHING_WRONG)
                            return
                        }
                        
                        self.Message = responseJSON["message"] as? String
                        self.responseObjectDic = (responseJSON as AnyObject?) as? Dictionary<String, AnyObject>

                        responseData(self.responseObjectDic, nil, self.Message)
                        
                    case .failure(let error):
                        print(error)
                        responseData(nil, error as NSError?, SOMETHING_WRONG)
                    }
                }
        }
    }
}
