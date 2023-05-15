//
//  Router.swift
//  VIPER Pettern
//
//  Created by Nazar Kopeika on 15.05.2023.
//

import Foundation /* Router - hellps to navigate and route throughout app. Router can route within its own module. Router - is the entry point where your entire flow for a module comes in */
import UIKit /* 56 */

//object
//Entry point

typealias EntryPoint = AnyView & UIViewController /* 56 */

protocol AnyRouter { /* 1 */
    var entry: EntryPoint? { get } /* 55 */
    
    static func start() -> AnyRouter /* 2 */
}

class UserRouter: AnyRouter { /* 3 */
    var entry: EntryPoint? /* 57 */
    
    static func start() -> AnyRouter { /* 4 */
        let router = UserRouter() /* 5 */
        
        //Assign VIP
        var view: AnyView = UserViewController() /* 47 */
        var presenter: AnyPresenter = UserPresenter() /* 48 */
        var interactor: AnyInteractor = UserInteractor() /* 49 */
        
        view.presenter = presenter /* 50 */
        
        interactor.presenter = presenter /* 51 */
        
        presenter.router = router /* 52 */
        presenter.view = view /* 53 */
        presenter.interactor = interactor /* 54 */
        
        router.entry = view as? EntryPoint /* 58 */ 
        
        return router /* 6 */
    }
}
