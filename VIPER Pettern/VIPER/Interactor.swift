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
        print("Start fetching") /* 100 */
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return } /* 72 */
        let task = URLSession.shared.dataTask(with: url) { [weak self] data , _, error in /* 73 */ /* 80 add weak self */
            guard let data = data, error == nil else { /* 74 */
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed)) /* 81 */
                return /* 75 */
            }
            do { /* 76 */
                let entities = try JSONDecoder().decode([User].self, from: data) /* 77 */
                self?.presenter?.interactorDidFetchUsers(with: .success(entities)) /* 85 */
            }
            catch { /* 78 */
                self?.presenter?.interactorDidFetchUsers(with: .failure(error)) /* 84 */
            }
        }
        task.resume() /* 79 */
    }
}
