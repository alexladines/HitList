//
//  HitListViewController.swift
//  HitList
//
//  Created by Alex Ladines on 5/10/19.
//  Copyright © 2019 Alex Ladines. All rights reserved.
//

import UIKit

class HitListViewController: UIViewController {
    
    // MARK: - Properties
    var names: [String] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var hitListTableView: UITableView!
    
    // MARK: - IBActions
    @IBAction func addBarButtonItemPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
            
            self.names.append(nameToSave)
            self.hitListTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,animated: true)
    }
    
    // MARK: - Methods
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hitListTableView.dataSource = self
        title = "The List"
        hitListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "HitCell")
    }
    
    // MARK: - Navigation

}
extension HitListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hitListTableView.dequeueReusableCell(withIdentifier: "HitCell", for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
    
}
