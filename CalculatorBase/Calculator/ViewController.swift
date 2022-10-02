//
//  ViewController.swift
//  Calculator
//
//  Created by Fabio Vinicius Binder on 03/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var visor: UILabel!
    
    // Número que está sendo digitado
    var numeroAtual: Int = 0
    
    // Resultado acumulado
    var resultado: Int = 0
    
    // Operador anterior
    var operador: String = "="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registrarNumero(_ sender: UIButton) {
        let digito = Int(sender.titleLabel?.text ?? "0")
        numeroAtual = numeroAtual * 10 + digito!
        
        visor.text = String(numeroAtual)
    }
    
    private func atualizarVisor(){
        numeroAtual = 0
        visor.text = String(resultado)
    }
    
    @IBAction func limpar(_ sender: Any) {
        resultado = 0
        atualizarVisor()
    }
    
    func executar(_ operador: String){
        switch operador {
            case "+": resultado += numeroAtual
            case "-": resultado -= numeroAtual
            case "*": resultado *= numeroAtual
            case "/": resultado /= numeroAtual
            default: visor.text = "Erro"
        }
    }
    
    @IBAction func registrarOperador(_ sender: UIButton) {
        operador = (sender.titleLabel?.text)!
        if resultado == 0 {
            resultado = numeroAtual
        } else {
            executar((sender.titleLabel?.text)!)
        }
        operador = (sender.titleLabel?.text)!
        atualizarVisor()
    }
    
    @IBAction func calcularResultado(_ sender: Any) {
        executar(operador)
        atualizarVisor()
    }
}
