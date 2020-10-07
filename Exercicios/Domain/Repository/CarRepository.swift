//
//  CarRepository.swift
//  Exercicios
//
//  Created by Marivaldo Sena on 07/10/20.
//

import Foundation

class CarRepository {
    private var items: [Car]
    private var selectedCar: Car?
    
    init(cars: [Car]) {
        self.items = cars
    }
    
    convenience init() {
        self.init(cars: [])
    }
    
    func addCar(car: Car) {
        self.items.append(car)
    }
    
    func addCar(car: [Car]) {
        self.items.append(contentsOf: car)
    }
    
    func setSelectedCar(car: Car?) {
        self.selectedCar = car
    }
    
    func getSelectedCar() -> Car? {
        return self.selectedCar
    }
    
    func getNumberOfCars() -> Int {
        return items.count
    }
    
    func getCar(at index: Int) -> Car? {
        if self.isIndexValid(index: index) {
            return self.items[index]
        }
    
        return nil
    }
    
    private func isIndexValid(index: Int) -> Bool {
        if index >= 0 && index < self.items.count {
            return true
        }
        
        return false
    }
}
