//
//  ViewController.swift
//  demo
//
//  Created by Develop on 1/31/22.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    struct Todo : Codable{
        //        "userId": 1,
        //        "id": 1,
        //        "title": "delectus aut autem",
        //        "completed": false
        
        var userId : Int
        var id: Int
        var title : String
        var completed : Bool
    }
    var arr : [Todo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://jsonplaceholder.typicode.com/todos").responseDecodable(of: [Todo].self) { response in
            print(response.value)
                guard let response = response.value else {return}
           self.arr = response
            print(response)
            self.tableView.reloadData()
            
        }
        
        
    }
    
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arr[indexPath.row].title
        return cell
    }
    
    
}
