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
    let name: String?
    let capital: String?
    let region: String?
}



class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    let decoder = JSONDecoder()
    var countryString : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func getJsonButton(_ sender: Any) {
        
        let url = "https://restcountries.eu/rest/v2/all"
        
        Alamofire.request(url).validate().responseJSON { response in
            //print(response.data.map { String(decoding: $0, as: UTF8.self) } ?? "No data.")
            do {
                
                let countries = try self.decoder.decode([Country].self, from: response.data! )
                for item in countries {
                    print(item.name! + " : " + item.capital!)
                    self.countryString += item.name! + " : " + item.capital! + "\n"
                }
                self.textView.text = self.countryString
                
            } catch {
                print("Error")
            }
        }
    }
}


