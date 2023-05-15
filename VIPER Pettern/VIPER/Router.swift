//
//  Router.swift
//  VIPER Pettern
//
//  Created by Nazar Kopeika on 15.05.2023.
//

import Foundation /* Router - hellps to navigate and route throughout app. Router can route within its own module. */
 
//object
//Entry point

protocol AnyRouter { /* 1 */
    static func start() -> AnyRouter /* 2 */
}

class UserRouter: AnyRouter { /* 3 */
    static func start() -> AnyRouter { /* 4 */
        let router = UserRouter() /* 5 */
        
        //Assign VIP
        
        return router /* 6 */
    }
}
