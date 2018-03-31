//
//  DestinationViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 13/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

/*extension UIImageView {
    func downloadedFrom(url: URL) {
       
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url)
    }
}*/


struct Destination: Decodable{
    let country: String
    let image_url: String
    
}

class DestinationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var DestionCollection = [Destination]()
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadJsonWithURL()
    }

   
    
    func downloadJsonWithURL() {
        let myUrl = URL(string: "http://vnoi.in/hmapi/destination.php");
        
        print(myUrl!)
        var request = URLRequest(url: myUrl! )
        
        request.httpMethod = "post"
        
        let postString = "action=destination";
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil
            {
                do{
                    self.DestionCollection = try JSONDecoder().decode([Destination].self, from: data!)
                }catch {
                    print("error")
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
            else if response != nil{
                
                
                print("response = \(String(describing: response))")
                
                
                
                
                
                
            }
            
            
        };task.resume()
        
       
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DestionCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Descell", for: indexPath)as!DestinationTableViewCell
        cell.Destinationlbl.text = DestionCollection[indexPath.row].country.capitalized
        let Desimg = DestionCollection[indexPath.row].image_url
        cell.Destinationimg.downloadedFrom(link: Desimg)
        return cell
    }

}
