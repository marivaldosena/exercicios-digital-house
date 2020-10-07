//
//  CarSeed.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 07/10/20.
//

import Foundation

struct CarSeed {
    private var items: [Car] = [
        Car(carName: "Car", imageName: K.Images.Cars.defaultCarImageName),
        Car(carName: "Kombi", imageName: K.Images.Cars.kombiImageName),
        Car(carName: "Brasilia", imageName: K.Images.Cars.brasiliaImageName),
        Car(carName: "Chevrolet", imageName: K.Images.Cars.chevroletImageName),
        Car(carName: "Fusca", imageName: K.Images.Cars.fuscaImageName),
        Car(carName: "Old Car", imageName: K.Images.Cars.oldCarImageName)
    ]
}
