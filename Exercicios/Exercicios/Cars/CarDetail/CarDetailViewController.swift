//
//  CarDetailViewController.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 07/10/20.
//

import UIKit

class CarDetailViewController: UIViewController {
    @IBOutlet weak var carImageView: UIImageView?
    @IBOutlet weak var carNameLabel: UILabel?
    
    private var repository: CarRepository?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUIInterface()
    }
    
    func setRepository(repository: CarRepository?) {
        self.repository = repository
    }
    
    func getRepository() -> CarRepository? {
        return self.repository
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
