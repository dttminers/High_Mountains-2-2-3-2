//
//  SideMenuViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 13/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
      let kHeaderSectionTag: Int = 6900;
    
  
    @IBOutlet weak var tableView: UITableView!
    
    var expandedSectionHeaderNumber: Int = -1
    var expandedSectionHeader: UITableViewHeaderFooterView!
    var sectionItems: Array<Any> = []
    var sectionNames: Array<Any> = []
    var sectionImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UINib(nibName : "SideDrawerProfileTVC", bundle:nil), forCellReuseIdentifier: "SideDrawerProfileTVC")
        tableView.register(UINib(nibName : "SideDrawerSectionTVC", bundle:nil), forCellReuseIdentifier: "SideDrawerSectionTVC")
        tableView.register(UINib(nibName : "SideDrawerTVC", bundle:nil), forCellReuseIdentifier: "SideDrawerTVC")
        
        sectionNames = [ "Travel Book", "Shop with us", "Be Entrepreneur", "Lets's Socailze", "Our Services"];
        sectionImages = [#imageLiteral(resourceName: "t1"),#imageLiteral(resourceName: "t1"),#imageLiteral(resourceName: "t1"),#imageLiteral(resourceName: "t1"),#imageLiteral(resourceName: "t1")]
        sectionItems = [ ["Travel with us", "Destinations", "Plan Trip", "iPhone 6 Plus", "Activities", "Theme", "Rentouts", "Find Guide", "Travel Bible", "Near By"],["All Products","Gift Cards"],["Refer A Friend", "Be A Guide", "Start A Blogging", "Give Rentouts"],
                         ["Let's Barter", "Let's Find Neighbour", "Let's Discuss","Let's Travel", "Get Help"],
                         ["Distance Calculator", "Trekking Routes", "Currency Converter", "Language Translator", "Travel Budget", "Offline Map"]
        ];
        self.tableView!.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Tableview Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if sectionNames.count > 0 {
            tableView.backgroundView = nil
            return sectionNames.count + 1
        } else {
            let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
            messageLabel.text = "Retrieving data.\nPlease wait."
            messageLabel.numberOfLines = 0;
            messageLabel.textAlignment = .center;
            messageLabel.font = UIFont(name: "Robot", size: 20.0)!
            messageLabel.sizeToFit()
            self.tableView.backgroundView = messageLabel;
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            if (self.expandedSectionHeaderNumber == section) {
                let arrayOfItems = self.sectionItems[section-1] as! NSArray
                return arrayOfItems.count;
            } else {
                return 0;
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        }
        else {
            if (self.sectionNames.count != 0) {
                return self.sectionNames[section-1] as? String
            }
            return ""
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else {
            return 35;
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section != 0 {
            
            let header = tableView.dequeueReusableCell(withIdentifier: "SideDrawerSectionTVC") as! SideDrawerSectionTVC
            header.lblTitle.text = sectionNames[section-1] as? String
            header.imgArrow.image = #imageLiteral(resourceName: "DOWNarrow")
            header.img.image = sectionImages[section-1]
            header.viewStatus.isHidden = true
            if (self.expandedSectionHeaderNumber == section) {
                header.imgArrow.image = #imageLiteral(resourceName: "UParrow")
                header.viewStatus.isHidden = false
            }
            // make headers touchable
            header.tag = section
            let headerTapGesture = UITapGestureRecognizer()
            headerTapGesture.addTarget(self, action: #selector(self.sectionHeaderWasTouched(_:)))
            header.addGestureRecognizer(headerTapGesture)
            return header
        }
        return UIView()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideDrawerProfileTVC", for: indexPath) as UITableViewCell
            
            return cell
        }
        else {
            let cell : SideDrawerTVC = tableView.dequeueReusableCell(withIdentifier: "SideDrawerTVC", for: indexPath) as! SideDrawerTVC
            let section = self.sectionItems[indexPath.section-1] as! NSArray
            //cell.textLabel?.textColor = UIColor.black
            cell.lblTitle.text = section[indexPath.row] as? String
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Expand / Collapse Methods
    
    @objc func sectionHeaderWasTouched(_ sender: UITapGestureRecognizer) {
        let headerView : UIView = sender.view! //as! UITableViewHeaderFooterView
        let section    = headerView.tag
        
        if (self.expandedSectionHeaderNumber == -1) {
            self.expandedSectionHeaderNumber = section
            tableViewExpandSection(section)
        } else {
            if (self.expandedSectionHeaderNumber == section) {
                tableViewCollapeSection(section)
            } else {
                //let cImageView = self.view.viewWithTag(kHeaderSectionTag + self.expandedSectionHeaderNumber) as? UIImageView
                tableViewCollapeSection(self.expandedSectionHeaderNumber)
                tableViewExpandSection(section)
            }
        }
    }
    
    func tableViewCollapeSection(_ section: Int) {
        let sectionData = self.sectionItems[section-1] as! NSArray
        
        self.expandedSectionHeaderNumber = -1;
        if (sectionData.count == 0) {
            return;
        } else {
            /*UIView.animate(withDuration: 0.4, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }*/
            //self.tableView!.beginUpdates()
            //self.tableView!.deleteRows(at: indexesPath, with: UITableViewRowAnimation.fade)
            //self.tableView!.endUpdates()
            self.tableView.reloadData()
        }
    }
    
    func tableViewExpandSection(_ section: Int) {
        let sectionData = self.sectionItems[section-1] as! NSArray
        
        if (sectionData.count == 0) {
            self.expandedSectionHeaderNumber = -1;
            return;
        } else {
            /*UIView.animate(withDuration: 0.4, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }*/
            self.expandedSectionHeaderNumber = section
            //self.tableView!.beginUpdates()
            //self.tableView!.insertRows(at: indexesPath, with: UITableViewRowAnimation.fade)
            //self.tableView!.endUpdates()
            tableView.reloadData()
        }
    }

   


}
