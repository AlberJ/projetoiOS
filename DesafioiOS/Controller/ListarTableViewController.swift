//
//  ListarTableViewController.swift
//  DesafioiOS
//
//  Created by IFPB on 21/07/2018.
//  Copyright © 2018 IFPB. All rights reserved.
//

import UIKit

class ListarTableViewController: UITableViewController {

    var cadastro: Cadastro!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        self.cadastro = delegate.cadastro
        
        print("\(delegate.arquivo())")
        
//        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print ("Quantidade de cadastro: \(self.cadastro.count())")
        return self.cadastro.count()
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print ("aki! antes de recuperar a celula")
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
print ("aki! depois de recuperar a celula")
        let hero = self.cadastro.get(index: indexPath.row)
        cell.textLabel?.text = hero.description
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.cadastro.del(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } //else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        self.cadastro.swap(origem: fromIndexPath.row, destino: to.row)
        self.tableView.reloadData()
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
