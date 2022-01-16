//
//  HistoryBmiTableViewController.swift
//  Live_Healthy
//
//  Created by Hesah Alqhtani on 16/12/2021.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class HistoryBmiTableViewController: UITableViewController {
    
    var bmiHistory : User?
    var bmiValues : [BMIValue] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let uid = Auth.auth().currentUser?.uid {
            UserApi.getUser(uid: uid) { user in
                self.bmiValues = user.bmiHistory ?? [BMIValue]()
                self.tableView.reloadData()
            }
            
        }else{
            
            
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bmiValues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTableViewCell
        
        cell.bmiHistLbl.text = "BMI: \(bmiValues[indexPath.row].bmi)"
        cell.dateLbl.text = bmiValues[indexPath.row].date
        
        // Configure the cell...
        
        return cell
    }
    
}
