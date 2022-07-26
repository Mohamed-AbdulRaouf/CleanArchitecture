//
//  NumberTriviaView.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/20/22.
//

import SwiftUI

struct NumberTriviaView: View {
    
    @ObservedObject private var numberTriviaViewModel = NumberTriviaViewModel()
    @State var inputNumber = ""
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Text(numberTriviaViewModel.numberTrivia?.number.description ?? "")
                        .font(.system(size: 25))
                        .padding(.top , 20)
                    Spacer()
                    Text(numberTriviaViewModel.numberTrivia?.text ?? "")
                        .font(.title2)
                        .padding()
                    Spacer()
                    TextField("Please add number", text: $inputNumber)
                        .frame(height: 45, alignment: .center)
                        .padding(.leading, 10)
                        .accentColor(.red)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        .cornerRadius(10)
                    HStack () {
                        Button(action: {
                            let number: Int = Int(inputNumber) ?? 0
                            self.numberTriviaViewModel.getConcreteNumberTrivia(number: number)
                        }) {
                            HStack {
                                Text("Search")
                            }
                            .padding()
                            .frame(width: 200, height: 40)
                            .foregroundColor(Color.white)
                            .background(Color.green)
                            .cornerRadius(5)
                        }
                        
                        Button(action: {
                            self.numberTriviaViewModel.getRandomNumberTrivia()
                        }) {
                            HStack {
                                Text("Get random trivia")
                            }
                            .padding()
                            .frame(width: 200, height: 40)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .cornerRadius(5)
                        }
                    }
                    Spacer()
                    Text(self.numberTriviaViewModel.errorMessage)
                        .font(.system(size: 25))
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Number Trivia")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NumberTriviaView_Previews: PreviewProvider {
    static var previews: some View {
        NumberTriviaView()
    }
}
