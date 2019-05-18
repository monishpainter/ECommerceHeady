//
//  Heady_iOS_Test
//
//  Created by Monish Painter on 17/05/19.
//  Copyright © 2019 Monish Painter. All rights reserved.
//

import Foundation

public enum WSRequestType : Int {
    
    case GetCategories
}

struct WebServicePrefix {
    
    static let Server_URL = "https://stark-spire-93433.herokuapp.com"
    static let WS_PATH = "/"
    
    static func GetWSUrl(serviceType :WSRequestType) -> String
    {
        var serviceURl: NSString?
        switch serviceType
        {
        case .GetCategories:
            serviceURl = "json"
            break
            
        }
        return "\(Server_URL)\(WS_PATH)\(serviceURl!)" as String
    }
}
