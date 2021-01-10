//
//  HomeViewController.swift
//  aprendiendo
//
//  Created by claudio melendres on 10/1/21.
//  Copyright © 2021 claudio melendres. All rights reserved.
//

import UIKit
import PopupDialog

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "mi-celda")

        // Do any additional setup after loading the view.
        tableView.delegate = self
    }
    
    private func showMessageDialog(mensaje: String) {
        let title = "Conferencia"
        let message = mensaje
        let image = UIImage(named: "pexels-photo-103290")

        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)

        // Create buttons
        let buttonOne = CancelButton(title: "CANCEL") {
            print("You canceled the car dialog.")
        }

        popup.addButtons([buttonOne])

        self.present(popup, animated: true, completion: nil)
    }
    
    

}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La Conferencia #\(indexPath.row) fue seleccionada.")
        showMessageDialog(mensaje: "La conferencia #\(indexPath.row) fue seleccionada.")
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mi-celda", for: indexPath)
        
        cell.textLabel?.text = "Conferencia Nro: #\(indexPath.row)"
        
        return cell
    }
}
