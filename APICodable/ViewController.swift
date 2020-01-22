//
//  ViewController.swift
//  APICodable
//
//  Created by Sudipto Roy on 1/22/20.
//  Copyright © 2020 Code-X Systems. All rights reserved.
//

import UIKit
import Alamofire

struct Country: Decodable {
    let name: String
    let capital: String
    let region: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = "https://restcountries.eu/rest/v2/all"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data, response, error) in
            
            do{
                let countries = try JSONDecoder().decode([Country].self, from: data!)
                
                for Country in countries {
                    print(Country.name + ":" + Country.capital)
                }
                
            } catch{
                print("Error")
            }
        }.resume()
    }
}

