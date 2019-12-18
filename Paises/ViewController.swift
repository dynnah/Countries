//
//  ViewController.swift
//  Paises
//
//  Created by IFPB on 18/12/2019.
//  Copyright © 2019 IFPB. All rights reserved.
//

import UIKit

struct jsonstruct: Decodable{
    let name: String
    let capital: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arrdata = [jsonstruct]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    
    func getData() {
        let url = URL(string: "https://restcountries.eu/rest/v2/lang/pt")
        URLSession.shared.dataTask(with: url!){ (data, response, error) in
            do{
                if error == nil{
                    self.arrdata = try
                        JSONDecoder().decode([jsonstruct].self, from: data!)
                    
                    for mainarr in self.arrdata{
                        print(mainarr.name, ";", mainarr.capital)
                        DispatchQueue.main.async {
                            self.tableview.reloadData()
                        }
                        
                    }
                }
                
            } catch{
                print("Error")
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lbname.text = arrdata[indexPath.row].name
        cell.lbcapital.text = arrdata[indexPath.row].capital
        
        return cell
    }

}

