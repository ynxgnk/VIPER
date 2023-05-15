//
//  View.swift
//  VIPER Pettern
//
//  Created by Nazar Kopeika on 15.05.2023.
//

import UIKit /* 18 */
import Foundation /* View - responsible for user interface. Example: If you tap on a button on your View, and you want to show a UIAlertController, you wouldnt want to do that here, you would want to tell the presenter: "Go ahead and present this alert". */

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
    
    private let label: UILabel = { /* 101 */
       let label = UILabel() /* 102 */
        label.textAlignment = .center /* 103 */
        label.isHidden = true /* 104 */
        return label /* 105 */
    }()
    
    var users: [User] = [] /* 90 */
    
    override func viewDidLoad() { /* 34 */
        super.viewDidLoad() /* 35 */
        view.addSubview(label) /* 106 */
        view.backgroundColor = .systemBlue /* 66 */
        view.addSubview(tableView) /* 41 */
        tableView.delegate = self /* 42 */
        tableView.dataSource = self /* 43 */
    }
    
    override func viewDidLayoutSubviews() { /* 67 */
        super.viewDidLayoutSubviews() /* 68 */
        tableView.frame = view.bounds /* 69 */
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50) /* 107 */
        label.center = view.center /* 108 */
    }
    
    func update(with users: [User]) { /* 32 */
        print("got users") /* 99 */
        DispatchQueue.main.async { /* 92 */
            self.users = users /* 91 */
            self.tableView.reloadData() /* 93 */
            self.tableView.isHidden = false /* 94 */
        }
    }
    
    func update(with error: String) { /* 33 */
        print(error) /* 113 */
        DispatchQueue.main.async { /* 109 */
            self.users = [] /* 110 */
            self.label.text = error /* 114 */
            self.tableView.isHidden = true /* 111 */
            self.label.isHidden = false /* 112 */
        }
    }
    
    //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { /* 45 */
        return users.count /* 95 */
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { /* 46 */
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) /* 96 */
        cell.textLabel?.text = users[indexPath.row].name /* 97 */
        return cell /* 98 */
    }
}
