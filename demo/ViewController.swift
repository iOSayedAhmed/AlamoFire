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
    
////    struct  DataModel:Codable {
////       var id:Int
////       var price:Double
////        var oldPrice:Double
////        var discount:Int
////        var name:String
////        var description:String
////    }
////    struct DataStruct:Codable {
////      var currentPage : Int
////        var data : [DataModel]
////    }
////    struct Products:Codable {
////
////        var status : Bool
////        var data : DataStruct
////
////    }
//
//    // MARK: - PurpleData
//    struct PurpleData: Codable {
//        let status: Bool
//        //let message: JSONNull?
//        let data: DataClass
//    }
//
//    // MARK: - DataClass
//    struct DataClass: Codable {
//        let currentPage: Int
//        let data: [Datum]
//        let firstPageURL: String
//        let from, lastPage: Int
//        let lastPageURL: String
//       // let nextPageURL: JSONNull?
//        let path: String
//        let perPage: Int
//       //let prevPageURL: JSONNull?
//        let to, total: Int
//
//        enum CodingKeys: String, CodingKey {
//            case currentPage = "current_page"
//            case data
//            case firstPageURL = "first_page_url"
//            case from
//            case lastPage = "last_page"
//            case lastPageURL = "last_page_url"
//           // case nextPageURL = "next_page_url"
//            case path
//            case perPage = "per_page"
//           // case prevPageURL = "prev_page_url"
//            case to, total
//        }
//    }
//
//    // MARK: - Datum
//    struct Datum: Codable {
//        let id: Int
//        let price, oldPrice: Double
//        let discount: Int
//        let image: String
//        let name, datumDescription: String
//        let images: [String]
//        let inFavorites, inCart: Bool
//
//        enum CodingKeys: String, CodingKey {
//            case id, price
//            case oldPrice = "old_price"
//            case discount, image, name
//            case datumDescription = "description"
//            case images
//            case inFavorites = "in_favorites"
//            case inCart = "in_cart"
//        }
//    }
//
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
