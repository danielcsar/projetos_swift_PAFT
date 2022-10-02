//
//  ItemTableViewController.swift
//  ShoppingList
//
//  Created by Aluno on 26/09/22.
//

import UIKit

class ItemTableViewController: UITableViewController {

    var shoppingLists = ListDAO.instance
    var listName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func createItem(_ sender: Any) {
        let createItem = UIAlertController(title: "Novo Item", message: "", preferredStyle: .alert)
        
        // Criar uma caixa de texto
        var text = UITextField()
        
        // Adicionar a caixa de texto no alerta
        createItem.addTextField { txt in
            txt.placeholder = "Item"
            text = txt
        }
        
        // Criar uma ação (botão + função)
        let action = UIAlertAction(title: "Adicionar", style: .default) { botao in
            // Adiconar o filme na lista de filmes
            self.shoppingLists.setItem(self.listName, (text.text!))
//            let cell = IndexPath(row: self.shoppingLists.list[self.listName]!.count - 1, section: 0)
//            self.tableView.beginUpdates()
//            self.tableView.insertRows(at: [cell], with: .bottom)
//            self.tableView.endUpdates()
            self.tableView.reloadData()
        }
        
        // Adicionar a ação no alerta
        createItem.addAction(action)
        createItem.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        
        // Mostrar o alerta
        present(createItem, animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shoppingLists.getList(listName).count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "items", for: indexPath)

        cell.textLabel!.text = shoppingLists.getList(listName)[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .checkmark
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listName
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.shoppingLists.removeItem(list: listName, pos: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}
