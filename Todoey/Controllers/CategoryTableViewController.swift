//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Igor Chernobai on 2/25/19.
//  Copyright © 2019 Igor Chernobai. All rights reserved.
//

import UIKit
import CoreData


class CategoryTableViewController: UITableViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categories = [Category]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()

    }
    
         // MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
         // MARK: - Data Manipulation Methods
    
    func saveCategories() {
        do {
        try context.save()
        } catch {
            print("\(error)")
        }
        tableView.reloadData()
    }
    func loadCategories() {
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        do {
        categories = try context.fetch(request)
        } catch {
            print("Error loading categories \(error))")
        }
        tableView.reloadData()
    }
    
 
     // MARK: - Add New Category
    @IBAction func addCategoryPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            self.categories.append(newCategory)
            
            self.saveCategories()
        }
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        present(alert, animated: true, completion: nil)
    }
    
    
    
}
