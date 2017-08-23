//
//  AppDelegate.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 16/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setUpData()
        
        /* Get references to all of our controllers so we can set the intial data */
        let tabBarController = self.window!.rootViewController as! UITabBarController
        
        /* This is the controller on the first tab, so we use the index of 0 */
        let locationSplitViewController = tabBarController.viewControllers![0] as! UISplitViewController
        
        /* The split view controller has two navigation controllers, the first one is for the Master View, the second one is for the Detail View */
        let locationNavControllerForMasterView = locationSplitViewController.viewControllers.first as! UINavigationController
        let locationNavControllerFordetailViewController = locationSplitViewController.viewControllers.last as! UINavigationController
        
        /* The table view controller is the first or top controller of the nav controller for the master view */
        let locationMasterViewController = locationNavControllerForMasterView.topViewController as! GeneralLocationTableViewController
        
        /* The detail view controller is the first or top controller of the nav controller for detail view */
        let locationDetailViewController = locationNavControllerFordetailViewController.topViewController as! GeneralLocationViewController
        
        /* Grab a default location from the model */
        let defaultLocation = GeneralLocationList.sharedInstance.locations[0]
        
        /* Set this as the default card to display in both the table view and detail view */
        locationMasterViewController.currentLocation = defaultLocation
        locationDetailViewController.currentLocation = defaultLocation
        
        /* Set the delegate in the table view to point to the detail view */
        locationMasterViewController.delegate = locationDetailViewController
        
        /* Because each of the navigation controllers are working independently of each other, we need to set up the navigation buttons manually.*/
        locationDetailViewController.navigationItem.leftItemsSupplementBackButton = true
        locationDetailViewController.navigationItem.leftBarButtonItem = locationSplitViewController.displayModeButtonItem

        //SET-UP OF TAB 2
        
        /* This is the controller on the second tab, so we use the index of 1 */
        let characterSplitViewController = tabBarController.viewControllers![1] as! UISplitViewController
        
        /* The split view controller has two navigation controllers, the first one is for the Master View, the second one is for the Detail View */
        let characterNavControllerForMasterView = characterSplitViewController.viewControllers.first as! UINavigationController
        let characterNavControllerFordetailViewController = characterSplitViewController.viewControllers.last as! UINavigationController
        
        /* The table view controller is the first or top controller of the nav controller for the master view */
        let characterMasterViewController = characterNavControllerForMasterView.topViewController as! CharacterListController
        
        /* The detail view controller is the first or top controller of the nav controller for detail view */
        let characterDetailViewController = characterNavControllerFordetailViewController.topViewController as! CharacterDetailController
        
        /* Grab a default location from the model */
        let defaultCharacter = CharacterList.sharedInstance.characters[0]
        
        /* Set this as the default card to display in both the table view and detail view */
        characterMasterViewController.currentCharacter = defaultCharacter
        characterDetailViewController.currentCharacter = defaultCharacter
        
        /* Set the delegate in the table view to point to the detail view */
        characterMasterViewController.delegate = characterDetailViewController
        
        /* Because each of the navigation controllers are working independently of each other, we need to set up the navigation buttons manually.*/
        characterDetailViewController.navigationItem.leftItemsSupplementBackButton = true
        characterDetailViewController.navigationItem.leftBarButtonItem = characterSplitViewController.displayModeButtonItem
        
        return true

    }
    
    func setUpData() {
        GeneralLocationList.sharedInstance.addNewGeneralLocation(name:"Phandalin",type:"City",desc:"The town consisted of forty or fifty simple log buildings, some build on old fieldstone foundations. More old ruins - crumbling stone walls covered in ivy and briars - surround the newer buildings.", image:"phandalin")
        let location1: GeneralLocation = GeneralLocationList.sharedInstance.locations[0]
        location1.addNewLocation(name:"Stonehill Inn", type:"Inn", address:"Somewhere in Phandalin", desc:"Toblen came from the east of the Triboar, seeking the opportunity in prospecting like many others. He soon found that he knew more about running an inn than mining, and so he established the inn.", image:"inn")
        location1.addNewLocation(name:"Rusty Cafe", type:"Cafe", address:"Somewhere in nowhere", desc:"Toblen came from the east of the Triboar, seeking the opportunity in prospecting like many others. He soon found that he knew more about running an inn than mining, and so he established the inn.", image:"cafe")
        let character1 = Character(name: "Aram Silverheart", species: "Human", location: location1.specificlocations[0], desc: "An old human, bent and bowed. He carries a walking stick in his left hand, but something suggests he might use it for more than walking", notes: "Gruff voice. Likes carpentry.", image:"human_male")
        CharacterList.sharedInstance.addCharacterToList(char: character1)
        GeneralLocationList.sharedInstance.locations[0].addNewLocation(name:"The Sleeping Giant", type:"Tavern", address:"Somewhere in Phandalin", desc:"An old crumbling stone building with boarded up windows.",image:"inn")
        let character2 = Character(name: "Gundren Rockseeker", species: "Dwarf", location: location1.specificlocations[1], desc: "An dwarf in the prime of his life.", notes: "Gruff voice. Likes carpentry.",image:"dwarf_male")
        CharacterList.sharedInstance.addCharacterToList(char: character2)
        
        
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "D_D_vs3")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

