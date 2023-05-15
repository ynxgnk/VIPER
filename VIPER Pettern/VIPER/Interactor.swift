//
//  Interactor.swift
//  VIPER Pettern
//
//  Created by Nazar Kopeika on 15.05.2023.
//

import Foundation /* Interactor - to get data or perform some type of interaction and when it completes the interaction, its hands it to the presenter, and then the presenter will take care of what to do */

//object
//protocol
//reference to presenter

protocol AnyInteractor { /* 14 */
    var presenter: AnyPresenter? { get set } /* 24 */
    
    func getUsers() /* 25 */
}
 
class UserInteractor: AnyInteractor { /* 15 */
    var presenter: AnyPresenter? /* 26 */
    
    func getUsers() { /* 27 */
        
    }
}
