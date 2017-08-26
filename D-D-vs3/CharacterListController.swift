//
//  CharacterListController.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 20/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import Foundation
import UIKit

protocol RefreshCharacter {
    func refresh (character: Character)
}

class CharacterListController: UITableViewController, UISearchResultsUpdating
{
    var model = CharacterList.sharedInstance
    
    var filteredLocations = [Character]()
    
    let searchController = UISearchController (searchResultsController: nil)
    
    var currentCharacter: Character?
    
    var delegate: RefreshCharacter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Characters"
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
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
        print(model.characters.count)
        return model.characters.count;
    }
    
    // displays each row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell     {
        let row = self.tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        
        // check which data source should be used for loading up each row in the table.
        let character : Character = changeDataSource(indexPath: indexPath as NSIndexPath)
        
        // Configure the cell
        row?.textLabel!.text = character.characterName
        row?.detailTextLabel!.text = character.characterSpecies
        row?.imageView?.image = UIImage(named: character.imageName)
        row?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return row!
        
    }

    func changeDataSource(indexPath: NSIndexPath) -> Character {
        var chosenCharacter: Character
        if searchController.isActive && searchController.searchBar.text != "" {
            chosenCharacter = filteredLocations[indexPath.row]
        }
        else {
            chosenCharacter = model.characters[indexPath.row]
        }
        return chosenCharacter
    }
    
    func updateSearchResults(for: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    func filterContentForSearchText (searchText: String, scope: String = "All"){
        var characters = model.characters
        filteredLocations = characters.filter {
            characters in return characters.characterName.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        currentCharacter = changeDataSource(indexPath: indexPath as NSIndexPath)
        
        // This points to our detail View controller so we are setting the property on the detail view
        // when we select a card in our master view.
        self.delegate?.refresh(character: currentCharacter!)
        
        // This is needed for when displayed in portrait and you need show the detail
        // view as a result of selecting an item.
        if let detailViewController = self.delegate as? CharacterDetailController {
            splitViewController?.showDetailViewController(detailViewController.navigationController!, sender: nil)
        }
    }
    
    
    
    
}
