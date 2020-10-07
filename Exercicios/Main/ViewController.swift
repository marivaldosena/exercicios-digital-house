//
//  ViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 04/10/20.
//

import UIKit

class ViewController: UIViewController {
    /*
     03 - Criar um app:
     - Tenha uma collectionview com 10 carros na vertical;
     - Cada célula deve ter o nome e a imagem do carro; (pode repetir a mesma imagem)
     - Quando tocar numa celula, deve abrir uma tela via navigation (push), nessa tela deve haver a imagem grande.
     
     04 - Criar um app:
     - Tenha uma collectionview com 20 nomes na horizontal;
     - Cada célula deve ter um nome numa label, e o background da celula ser cinza fraco;
     - Ao tocar na celula, reve remover ela da collectionview, do array e recarregar.
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func goTo(_ sender: UIButton) {
        if let buttonTitle = sender.currentTitle {
            switch buttonTitle {
            case "View Employees":
                goToEmployeesList()
            case "View Animals":
                goToAnimalList()
            default:
                print("Error")
            }
        }
    }
}
