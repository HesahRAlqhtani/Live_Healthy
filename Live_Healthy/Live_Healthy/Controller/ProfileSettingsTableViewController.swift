//
//  ProfileSettingsTableViewController.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 16/12/2021.
//

import UIKit

class ProfileSettingsTableViewController: UITableViewController {

    @IBAction func switchApperance(_ sender: Any) {
        
        if #available(iOS 13.0, *){
            let appDelegate = UIApplication.shared.windows.first
            if(sender as AnyObject).isOn {
                appDelegate?.overrideUserInterfaceStyle = .dark
                return
            }
            appDelegate?.overrideUserInterfaceStyle = .light
            return
            
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    fileprivate func changeApperance() {
//        if overrideUserInterfaceStyle == .dark {
//            overrideUserInterfaceStyle = .light
//        } else {
//            overrideUserInterfaceStyle = .dark
//        }
//        if #available(iOS 13.0, *){
//            let appDelegate = UIApplication.shared.windows.first
//            if(sender as AnyObject).isOn {
//                appDelegate?.overrideUserInterfaceStyle = .dark
//                return
//            }
//            appDelegate?.overrideUserInterfaceStyle = .light
//            return
//
//
//        }
//  }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 1 {
                changeLang()
            } else {
                
            }
        }
    }
    func changeLang() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {return}
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
  

}
