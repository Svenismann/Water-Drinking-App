//
//  SettingsTableViewController.swift
//  WaterDrinkingApp
//
//  Created by Sven Forstner on 12.05.16.
//  Copyright © 2016 Sven Forstner. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    var userDefaults = NSUserDefaults()

    @IBOutlet var settingsTableView: UITableView! = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 3
        
    }*/

    /*override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func restoreDefaults(sender: UIButton) {
        
        userDefaults.removeObjectForKey("userAge")
        userDefaults.removeObjectForKey("userWeight")
        userDefaults.removeObjectForKey("userActivity")
        userDefaults.removeObjectForKey("userNeeds")
    userDefaults.removeObjectForKey("isAppAlreadyLaunchedOnce")
        
        print("Defaults Restored")

    }

}
