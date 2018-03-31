//
//  ThemesViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 10/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
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
}

struct Theme: Decodable{
    let title: String
    let theme_image: String
    
}

class ThemesViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  var heros = [Theme]()
    
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.downloadJsonWithURL()
        
    }
    
   // final let myUrl = "http://vnoi.in/hmapi/package.php"

    
    func downloadJsonWithURL() {
       let myUrl = URL(string: "http://vnoi.in/hmapi/package.php");
        
        print(myUrl!)
        var request = URLRequest(url: myUrl! )
        
        request.httpMethod = "post"
        
        let postString = "action=themes";
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil
            {
                do{
                    self.heros = try JSONDecoder().decode([Theme].self, from: data!)
                }catch {
                    print("error")
                }
                DispatchQueue.main.async {
                    self.collectionview.reloadData()
                }
            }
            else if response != nil{
                
                
                print("response = \(String(describing: response))")
                
                
                
                
                
            
         }


       };task.resume()
        
        

    }
    


    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return heros.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Themescell", for: indexPath)as!ThemesCollectionViewCell
        cell.themebrandlbl.text = heros[indexPath.row].title.capitalized
        cell.themesimg.contentMode = .scaleAspectFill
      
        let def1 =  heros[indexPath.row].theme_image
        cell.themesimg.downloadedFrom(link: def1)
       
        return cell
    
    
    }
        
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 2.5
        
        let numberofitemperrow:CGFloat = 2.0
        let itemawidth = (collectionView.bounds.width - layout.minimumLineSpacing) / numberofitemperrow
        
        return CGSize(width: itemawidth, height: itemawidth)
    }

    


}


