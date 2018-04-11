//
//  All_DestinationVC.swift
//  High_Mountains
//
//  Created by Abhishek on 11/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class All_DestinationVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    
    var Fav = ["hiab"]

    @IBOutlet weak var Dropdowntbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       Dropdowntbl.delegate = self
        Dropdowntbl.dataSource = self
    }

    @IBAction func btnDropDown(_ sender: Any) {
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Fav.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

}
