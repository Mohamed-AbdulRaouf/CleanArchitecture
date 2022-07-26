//
//  NumberTriviaViewModel.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/21/22.
//

import Foundation
import Combine

class NumberTriviaViewModel: ObservableObject {
    
    @Published var numberTrivia: NumberTrivia?
    var useCases: NumberTriviaUsecases = NumberTriviaUsecases()
    @Published var errorMessage: String = ""
    
    func getConcreteNumberTrivia(number: Int) {
        clearErrorMessage()
        if validateNumber(number: number) {
            useCases.getConcreteNumberTrivia(number: number, completion: { error, data in
                if error != nil {
                    self.clearData()
                    DispatchQueue.main.async {
                        self.errorMessage = error?.message ?? ""
                    }
                    return
                }
                guard let data = data else {return}
                DispatchQueue.main.async {
                    self.numberTrivia = data
                }
            })
        } else {
            self.errorMessage = "Please add integer numbers"
        }
    }
    
    func getRandomNumberTrivia() {
        clearErrorMessage()
        useCases.getRandomNumberTrivia(completion: { error, data in
            if error != nil {
                self.clearData()
                print(error?.message ?? "")
                DispatchQueue.main.async {
                    self.errorMessage = error?.message ?? ""
                }
                return
            }
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.numberTrivia = data
            }
        })
    }
    
    private func validateNumber(number: Int) -> Bool {
        return number != 0
    }
    
    private func clearErrorMessage() {
        self.errorMessage = ""
    }
    
    private func clearData() {
        self.numberTrivia?.number = 0
        self.numberTrivia?.text = "########"
    }
}
