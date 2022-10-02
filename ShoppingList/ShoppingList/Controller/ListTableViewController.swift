//
//  ListTableViewController.swift
//  ShoppingList
//
//  Created by Aluno on 26/09/22.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var shoppingLists = ListDAO.instance
    var name: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    @IBAction private func createList(_ sender: Any) {
        let createList = UIAlertController(title: "Nova Lista", message: "", preferredStyle: .alert)
        
        // Criar uma caixa de texto
        var text = UITextField()
        
        // Adicionar a caixa de texto no alerta
        createList.addTextField { txt in
            txt.placeholder = "Nome da lista"
            text = txt
        }
        
        // Criar uma ação (botão + função)
        let action = UIAlertAction(title: "Adicionar", style: .default) { botao in
            // Adiconar o filme na lista de filmes
            self.shoppingLists.setList(newList: [(text.text!) : []])
            self.tableView.reloadData()
        }
        
        // Adicionar a ação no alerta
        createList.addAction(action)
        createList.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        
        // Mostrar o alerta
        present(createList, animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shoppingLists.list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lists", for: indexPath)

        cell.textLabel?.text = shoppingLists.getAllListNames()[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // Delete - Criar animação de arrastar para esquerda, o botão de excluir e a ação de remover
    override func tableView(_ tableView: UITableView,trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "Excluir"){
            action, view, boolAction in
            
            let name = self.shoppingLists.getAllListNames()[indexPath.row]
            
            self.shoppingLists.removeList(key: name)
            
            tableView.performBatchUpdates {
                tableView.deleteRows(at: [indexPath], with: .fade)
            } completion: { completed in
                // Ação depois de completado
            }
            boolAction(true) // Fechar o botão de excluir automatico
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = segue.destination as! ItemTableViewController
        
        item.listName = (tableView.cellForRow(at: tableView.indexPathForSelectedRow!)?.textLabel?.text)!
    }
}
