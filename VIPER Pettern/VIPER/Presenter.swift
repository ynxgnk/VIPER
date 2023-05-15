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

enum FetchError: Error { /* 82 */
    case failed /* 83 */
}

protocol AnyPresenter { /* 9 */
    var router: AnyRouter? { get set } /* 11 */
    var interactor: AnyInteractor? { get set } /* 12 */
    var view: AnyView? { get set } /* 13 */
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) /* 19 */
}

class UserPresenter: AnyPresenter { /* 10 */
    var router: AnyRouter? /* 20 */
    
    var interactor: AnyInteractor? { /* 21 */
        didSet { /* 70 */
            interactor?.getUsers() /* 71 */ 
        }
    }
    
    var view: AnyView? /* 22 */
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) { /* 23 */
        switch result { /* 86 */
        case .success(let users): /* 87 */
            view?.update(with: users) /* 88 */
        case .failure(let error): /* 87 */
            view?.update(with: "Something went wrong") /* 89 */
        }
    }
}
