//
//  View.swift
//  VIPER Pettern
//
//  Created by Nazar Kopeika on 15.05.2023.
//

import UIKit /* 18 */
import Foundation /* View - responsible for user interface */

//ViewController
//protocol
//reference presenter

protocol AnyView { /* 16 */
    var presenter: AnyPresenter? { get set } /* 28 */
    
    func update(with users: [User]) /* 29 */
    func update(with error: String) /* 30 */
}

class UserViewController: UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource { /* 17 */ /* 44 add 2 protocols */
    var presenter: AnyPresenter? /* 31 */
    
    private let tableView: UITableView = { /* 36 */
        let table = UITableView() /* 37 */
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell") /* 39 */
        table.isHidden = true /* 40 */
        return table /* 38 */
    }()
    
    override func viewDidLoad() { /* 34 */
        super.viewDidLoad() /* 35 */
        view.addSubview(tableView) /* 41 */
        tableView.delegate = self /* 42 */
        tableView.dataSource = self /* 43 */
    }
    
    func update(with users: [User]) { /* 32 */
        
    }
    
    func update(with error: String) { /* 33 */
        
    }
    
    //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { /* 45 */
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { /* 46 */
        return UITableViewCell()
    }
}
