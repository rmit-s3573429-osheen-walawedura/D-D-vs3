//
//  GeneralLocationController.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 19/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import Foundation
import UIKit

class GeneralLocationTableViewController: UITableViewController
{
    var model = GeneralLocationList.sharedInstance
    
    
    //    var generalLocation = GeneralLocationDetail().getName()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "General Locations"
        print(model.locations.count)
    }
    
    //returning the number of items in the array to populate tablerows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return model.locations.count;
    }

    // displays each row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell     {
        let row = self.tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        
        // check which data source should be used for loading up each row in the table.
        let location : GeneralLocation = model.locations[indexPath.item]
        
        // Configure the cell
        row?.textLabel!.text = location.getName()
        row?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return row!
        
    }
}
