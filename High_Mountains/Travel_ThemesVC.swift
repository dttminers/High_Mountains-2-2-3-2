//
//  Travel_ThemesVC.swift
//  High_Mountains
//
//  Created by Abhishek on 11/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class Travel_ThemesVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
  
    
    @IBOutlet weak var ThemesCV: UICollectionView!
    
    var Themes : [TravelTheme] = []
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ThemesCV.register(UINib(nibName: "Travel_ThemesCVC", bundle:nil), forCellWithReuseIdentifier: "Travel_ThemesCVC")
        self.URLDownload()
        
       // self.viewDidLoad1()
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Themes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : Travel_ThemesCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "Travel_ThemesCVC", for: indexPath) as! Travel_ThemesCVC
        cell.populateData(Themes[indexPath.row])
        return cell
    }
    
    func viewDidLoad1() {
        
        //Define Layout here
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        //Get device width
        let width = UIScreen.main.bounds.width
        
        //set section inset as per your requirement.
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        
        //set cell item size here
        layout.itemSize = CGSize(width: width/2.5 , height: width/2 )
        
        //set Minimum spacing between 2 items
        layout.minimumInteritemSpacing = 1
        
        //set minimum vertical line spacing here between two lines in collectionview
        layout.minimumLineSpacing = 1
        
        //apply defined layout to collectionview
        ThemesCV!.collectionViewLayout = layout
        
    }
    
    func URLDownload()
    {
        let postparam = "action=themes&&uid=\(userId)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)package.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                let res : [AnyObject] = dt.object as! [AnyObject]
                print(res)
                
                self.Themes = DATA_MANAGER.setThemesDictionary(res)
                self.ThemesCV.reloadData()
            }
            else {
                self.alertDialog(msg: result as! String)
            }
        })
    }

}
