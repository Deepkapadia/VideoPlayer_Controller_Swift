//
//  ViewController.swift
//  Weather
//
//  Created by DeEp KapaDia on 24/11/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit


struct query:Decodable{
    
    let results:Result
    
    
}

struct Result:Decodable {
    
    let channel:Channel
    
}

struct Channel: Decodable {
    
    let location:[Location]!
    
}

struct Location:Decodable {
    
    let city:String
    let country:String
    let region:String
    
}

class ViewController: UIViewController {

    var Query:query?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Datas()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


        
    private func Datas(){
        
        let url = URL(string: "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22nome%2C%20ak%2C%20IND%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil{
                do{
                    
                    self.Query = try JSONDecoder().decode(query.self, from: data!)
                    
                    DispatchQueue.main.async {
                        
                        if let samp = self.Query{
                            print("location:",samp.results.channel.location)
                            
                        }
                        
                    }
                    
                }
                catch{
                    
                    print(error.localizedDescription)
                    
                }
            }
            
            }.resume()
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

