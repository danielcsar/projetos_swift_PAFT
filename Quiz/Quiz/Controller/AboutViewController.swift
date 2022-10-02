//
//  AboutViewController.swift
//  Quiz
//
//  Created by Daniel on 16/09/22.
//

import UIKit

class AboutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sobre"
    }
    
    @IBAction func openLink(_ sender: UIButton) {
        let url = URL(string: "https://br.linkedin.com/in/danielcsar")
        UIApplication.shared.open(url!)
    }
}
