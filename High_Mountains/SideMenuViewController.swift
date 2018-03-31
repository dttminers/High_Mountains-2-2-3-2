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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UINib(nibName : "SideDrawerProfileTVC", bundle:nil), forCellReuseIdentifier: "SideDrawerProfileTVC")
        
        
        sectionNames = [ "Travel Book", "Shop with us", "Be Entrepreneur", "Lets's Socailze", "Our Services"];
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
            messageLabel.font = UIFont(name: "Arial", size: 20.0)!
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
            let header: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 35))//UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
            //header.contentView.backgroundColor = UIColor.colorWithHexString(hexStr: "#408000")
            //header.textLabel?.textColor = UIColor.black
            
            if let viewWithTag = self.view.viewWithTag(kHeaderSectionTag + section) {
                viewWithTag.removeFromSuperview()
            }
            let headerFrame = 300//self.view.frame.size.width
            
            let lbl : UILabel = UILabel(frame: CGRect(x: 10, y: 13, width:tableView.frame.size.width - 40, height: 18))
            lbl.text = sectionNames[section-1] as? String
            header.addSubview(lbl)
            let theImageView = UIImageView(frame: CGRect(x: headerFrame-32, y: 13, width:18, height: 18));
            theImageView.backgroundColor = UIColor.blue
            theImageView.image = #imageLiteral(resourceName: "Chevron-Dn-Wht")//UIImage(named: "Chevron-Dn-Wht")
            theImageView.tag = kHeaderSectionTag + section
            if (self.expandedSectionHeaderNumber == section) {
                theImageView.image = #imageLiteral(resourceName: "arrow")
            }
            header.addSubview(theImageView)
            
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
            let section = self.sectionItems[indexPath.section-1] as! NSArray
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.text = section[indexPath.row] as? String
            
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
        let eImageView = headerView.viewWithTag(kHeaderSectionTag + section) as? UIImageView
        
        if (self.expandedSectionHeaderNumber == -1) {
            self.expandedSectionHeaderNumber = section
            tableViewExpandSection(section, imageView: eImageView!)
        } else {
            if (self.expandedSectionHeaderNumber == section) {
                tableViewCollapeSection(section, imageView: eImageView!)
            } else {
                let cImageView = self.view.viewWithTag(kHeaderSectionTag + self.expandedSectionHeaderNumber) as? UIImageView
                tableViewCollapeSection(self.expandedSectionHeaderNumber, imageView: cImageView!)
                tableViewExpandSection(section, imageView: eImageView!)
            }
        }
    }
    
    func tableViewCollapeSection(_ section: Int, imageView: UIImageView) {
        let sectionData = self.sectionItems[section-1] as! NSArray
        
        self.expandedSectionHeaderNumber = -1;
        if (sectionData.count == 0) {
            return;
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }
            //self.tableView!.beginUpdates()
            //self.tableView!.deleteRows(at: indexesPath, with: UITableViewRowAnimation.fade)
            //self.tableView!.endUpdates()
            self.tableView.reloadData()
        }
    }
    
    func tableViewExpandSection(_ section: Int, imageView: UIImageView) {
        let sectionData = self.sectionItems[section-1] as! NSArray
        
        if (sectionData.count == 0) {
            self.expandedSectionHeaderNumber = -1;
            return;
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }
            self.expandedSectionHeaderNumber = section
            //self.tableView!.beginUpdates()
            //self.tableView!.insertRows(at: indexesPath, with: UITableViewRowAnimation.fade)
            //self.tableView!.endUpdates()
            tableView.reloadData()
        }
    }

   


}
