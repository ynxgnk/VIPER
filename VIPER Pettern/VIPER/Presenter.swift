//
//  Presenter.swift
//  VIPER Pettern
//
//  Created by Nazar Kopeika on 15.05.2023.
//

import Foundation /* Presenter - its a glue that ties everything together */

//object
//protocol
//reference tointeractor, router, view

protocol AnyPresenter { /* 9 */
    var router: AnyRouter? { get set } /* 11 */
    var interactor: AnyInteractor? { get set } /* 12 */
    var view: AnyView? { get set } /* 13 */
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) /* 19 */
}

class UserPresenter: AnyPresenter { /* 10 */
    var router: AnyRouter? /* 20 */
    
    var interactor: AnyInteractor? /* 21 */
    
    var view: AnyView? /* 22 */
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) { /* 23 */
        
    }
}
