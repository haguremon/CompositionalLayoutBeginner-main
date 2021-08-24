//
//  AccountTableViewController.swift
//  CompositionalLayoutUbereats
//
//  Created by IwasakIYuta on 2021/08/06.
//

import UIKit

class AccountTableViewController: UITableViewController, GetUserInfo {
    
    static let cellid = "cell"
    
    private var userInfo = [User]()
    private let getUserAPI = GetUserAPI()
    private let accountInfo = ["square","paperplane","down","gear","magnifyingglass","clock"]
    private let icon = ["square.and.arrow.up","paperplane","arrow.down.to.line","gear","magnifyingglass","clock"]
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserAPI.delegate = self
        getUserAPI.setUserInfo()
        
    }
    func getUserInfo(user: [User]) {
        self.userInfo = user
        
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
            
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return userInfo.count
        case 1:
            return accountInfo.count
        default:
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewController.cellid, for: indexPath) as! TableViewCell
        //cell.backgroundColor = .systemGray

        if indexPath.section == 0 {
            cell.label.textColor = .black
            //cell.label.textAlignment = .center
            cell.label.text = userInfo[indexPath.row].login
            let avatarImage =  userInfo.first?.avatarurl
            let imageUrl = URL(string: avatarImage!)!
            let imageData = try! Data(contentsOf: imageUrl)
            cell.image.contentMode = .scaleAspectFill
            cell.image.backgroundColor = .black
            cell.image.image = UIImage(data: imageData)
        } else {
            //cell.label.textAlignment = .center
            cell.label.text = accountInfo[indexPath.row]
            cell.image.contentMode = .center
            cell.image.image = UIImage(systemName: icon[indexPath.row])
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 60
        }
        return 50
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
