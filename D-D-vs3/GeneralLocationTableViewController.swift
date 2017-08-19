//
//  GeneralLocationController.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 19/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import Foundation
import UIKit

class GeneralLocationTableViewController: UITableViewController, UISearchResultsUpdating
{
    var model = GeneralLocationList.sharedInstance
    
    var filteredLocations = [GeneralLocation]()
    
    let searchController = UISearchController (searchResultsController: nil)
    
    
    //    var generalLocation = GeneralLocationDetail().getName()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "General Locations"
        print(model.locations.count)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
    }
    
    //returning the number of items in the array to populate tablerows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if searchController.isActive && searchController.searchBar.text != ""{
            return filteredLocations.count
        }
        return model.locations.count;
    }

    // displays each row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell     {
        let row = self.tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        
        // check which data source should be used for loading up each row in the table.
        let location : GeneralLocation = changeDataSource(indexPath: indexPath as NSIndexPath)
        
        // Configure the cell
        row?.textLabel!.text = location.getName()
        row?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return row!
        
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?)
    {
        print("Fuck you")
        // Grab the current card
        let indexPath = self.tableView.indexPathForSelectedRow!
        let card : GeneralLocation = changeDataSource(indexPath: indexPath as NSIndexPath)
        
        // Set a property on the destination view controller
        let detailsVC = segue.destination as! GeneralLocationViewController
        
        detailsVC.location = card
    }
    
    func changeDataSource(indexPath: NSIndexPath) -> GeneralLocation {
        var card: GeneralLocation
        if searchController.isActive && searchController.searchBar.text != "" {
            card = filteredLocations[indexPath.row]
        }
        else {
            card = model.locations[indexPath.row]
        }
        return card
    }
    
    func updateSearchResults(for: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    func filterContentForSearchText (searchText: String, scope: String = "All"){
        var locations = model.locations
        filteredLocations = locations.filter {
            locations in return locations.getName().lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }

}
