//
//  QuestionsTableViewController.swift
//  Quiz
//
//  Created by Daniel on 16/09/22.
//

import UIKit

class QuestionsTableViewController: UITableViewController {

    var questions = QuestionsList.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Questões"
    }

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return questions.list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questions", for: indexPath)

        cell.textLabel?.text = questions.list[indexPath.row].question

        return cell
    }
    
    // Função para célula n ficar selecionada depois de clicada
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Delete - Criar animação de arrastar para esquerda, o botão de excluir e a ação de remover
    override func tableView(_ tableView: UITableView,trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "Excluir"){
            action, view, boolAction in

            self.questions.list.remove(at: indexPath.row)
            tableView.performBatchUpdates {
                tableView.deleteRows(at: [indexPath], with: .fade)
            } completion: { completed in
                // Ação depois de completado
            }
            boolAction(true) // Fechar o botão de excluir automatico
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addEdit: AddEditViewController = segue.destination as! AddEditViewController
        
        if (segue.identifier == "cells") {
            let selectedRow = tableView.indexPathForSelectedRow!.row
            
            addEdit.index = selectedRow
            addEdit.question = questions.list[selectedRow].question
            addEdit.answer1 = questions.list[selectedRow].answer1
            addEdit.answer2 = questions.list[selectedRow].answer2
            addEdit.answer3 = questions.list[selectedRow].answer3
        } else {
            addEdit.isNewQuestion = true
        }
    }
}
