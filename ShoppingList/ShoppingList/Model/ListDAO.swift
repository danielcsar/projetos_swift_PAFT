//
//  ListDAO.swift
//  ShoppingList
//
//  Created by Aluno on 24/09/22.
//

import Foundation

class ListDAO {
    
    static let instance = ListDAO()
    
    var list = [String: [String]]()
    
    let file = FileManager
                    .default
                    .urls(for: .documentDirectory, in: .userDomainMask)
                    .first?
                    .appendingPathComponent("list.plist")
    
    // Constructos
    init() {
//        list = ["Mercado": ["Arroz","Feijão","Macarrão"], "Estudos": ["Swift", "Python", "Java"]]
//        encodeAndSave()
        decodeList()
    }
    
    func getItem(_ nameList: String, _ pos: Int) -> String {
        let newList = list[nameList]
        return newList![pos]
    }
    
    func setItem(_ nameList: String, _ item: String) {
        decodeList()
        self.list[nameList]!.append(item)
        encodeAndSave()
    }
    
    func getAllList() -> [String: [String]] {
        decodeList()
        return list
    }
    
    func getList(_ nameList: String) -> [String] {
        decodeList()
        return Array(list[nameList]!)
    }
    
    func setList(newList: [String: [String]]) {
        decodeList()
        self.list[newList.keys.first!] = newList.values.first
        encodeAndSave()
    }
    
    func getAllListNames() -> [String] {
        return Array(self.list.keys)
    }
    
    func size() -> Int {
        return list.count
    }
    
    func removeList(key: String) {
        self.list.removeValue(forKey: key)
        encodeAndSave()
    }
    
    func removeItem(list: String, pos: Int) {
        decodeList()
        self.list[list]!.remove(at: pos)
        encodeAndSave()
    }
    
    private func encodeAndSave(){
        do {
            // Codificar o valor a ser gravado
            let dados = try PropertyListEncoder().encode(self.list)
            
            // Gravar o valor codificado
            try dados.write(to: self.file!)
        } catch {
            print("Erro ao gravar o arquivo: \(error)")
        }
    }
    
    private func decodeList() {
        do {
            // Verificar se existe o arquivo e pegar os dados
            if let data = try? Data(contentsOf: file!) {
                // Decodificar
                list = try PropertyListDecoder().decode([String: [String]].self, from: data)
            }
        } catch {
            print("Erro ao ler o arquivo: \(error)")
        }
    }
}
