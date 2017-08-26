//
//  GeneralLocationController.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 19/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import Foundation
import UIKit

protocol Refresh {
    func refresh (location: GeneralLocation)
}

class GeneralLocationTableViewController: UITableViewController, UISearchResultsUpdating
{
    var model = GeneralLocationList.sharedInstance
    
    var filteredLocations = [GeneralLocation]()
    
    let searchController = UISearchController (searchResultsController: nil)
    
    var currentLocation: GeneralLocation?
    
    var delegate: Refresh?
    
    //    var generalLocation = GeneralLocationDetail().getName()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "General Locations"
        print(model.locations.count)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.isAccessibilityElement = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        super.viewDidAppear(animated)
        
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
        row?.isAccessibilityElement = true
        row?.textLabel!.text = location.getName()
        row?.detailTextLabel!.text = location.locationType
        
        if location.imageName.contains("asset_"){
                row?.imageView?.image = UIImage(named: location.imageName)
        }
        else{
                        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
                        let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
                        let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
                        if let dirPath          = paths.first
                        {
                            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("asset-"+location.getName()+".jpg")
                            row?.imageView?.image   = UIImage(contentsOfFile: imageURL.path)
            }
        }
        
        row?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return row!
        
    }
    
    func changeDataSource(indexPath: NSIndexPath) -> GeneralLocation {
        var chosenLocation: GeneralLocation
        if searchController.isActive && searchController.searchBar.text != "" {
            chosenLocation = filteredLocations[indexPath.row]
            print ("Searching filtered list")
        }
        else {
            chosenLocation = model.locations[indexPath.row]
            print ("Not searching filtered list")
        }
        return chosenLocation
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        currentLocation = changeDataSource(indexPath: indexPath as NSIndexPath)
        // This points to our detail View controller so we are setting the property on the detail view
        // when we select a card in our master view.
        self.delegate?.refresh(location: currentLocation!)
        
        // This is needed for when displayed in portrait and you need show the detail
        // view as a result of selecting an item.
        if let detailViewController = self.delegate as? GeneralLocationViewController {
            splitViewController?.showDetailViewController(detailViewController.navigationController!, sender: nil)
        }
    }

}
