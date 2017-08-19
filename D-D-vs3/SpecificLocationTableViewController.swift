//
//  SpecificLocationTableViewController.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 19/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import Foundation
import UIKit

class SpecificLocationTableViewController: UITableViewController, UISearchResultsUpdating
{
    var model: GeneralLocation?
    
    var filteredLocations = [SpecificLocation]()
    
    let searchController = UISearchController (searchResultsController: nil)
    
    
    //    var generalLocation = GeneralLocationDetail().getName()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Specific Locations"
        print(model!.specificlocations.count)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
    }
    
    //returning the number of items in the array to populate tablerows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print ("Total lines: " + String(model!.specificlocations.count))
        if searchController.isActive && searchController.searchBar.text != ""{
            return filteredLocations.count
        }
        return model!.specificlocations.count;
    }
    
    // displays each row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell     {
        let row = self.tableView.dequeueReusableCell(withIdentifier: "cell2") as UITableViewCell!
        
        // check which data source should be used for loading up each row in the table.
        let location : SpecificLocation = changeDataSource(indexPath: indexPath as NSIndexPath)
        
        // Configure the cell
        row?.textLabel!.text = location.getName()
        row?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return row!
        
    }
    
    func changeDataSource(indexPath: NSIndexPath) -> SpecificLocation {
        var card: SpecificLocation
        if searchController.isActive && searchController.searchBar.text != "" {
            card = filteredLocations[indexPath.row]
        }
        else {
            card = model!.specificlocations[indexPath.row]
        }
        return card
    }
    
    func updateSearchResults(for: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    func filterContentForSearchText (searchText: String, scope: String = "All"){
        var locations = model!.specificlocations
        filteredLocations = locations.filter {
            locations in return locations.getName().lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?)
    {
        print("Fuck you")
        // Grab the current card
        let indexPath = self.tableView.indexPathForSelectedRow!
        let card : SpecificLocation = changeDataSource(indexPath: indexPath as NSIndexPath)
        
        // Set a property on the destination view controller
        let detailsVC = segue.destination as! SpecificDetailController
        
        detailsVC.location = card
    }
}
