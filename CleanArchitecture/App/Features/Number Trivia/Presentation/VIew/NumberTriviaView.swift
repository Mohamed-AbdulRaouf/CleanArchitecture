//
//  NumberTriviaView.swift
//  CleanArchitecture
//
//  Created by mohamed on 7/20/22.
//

import SwiftUI

struct NumberTriviaView: View {
    @State var number = 0
    @State var inputNumber = ""
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Text("\(number)")
                        .font(.system(size: 25))
                        .padding(.top , 20)
                    Spacer()
                    Text("\(number) is the number of laws of cricket.")
                        .font(.title2)
                    Spacer()
                    TextField("Please add number", text: $inputNumber)
                        .frame(height: 45, alignment: .center)
                        .padding(.leading, 10)
                        .accentColor(.red)
                        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                        .cornerRadius(10)
                    HStack () {
                        Button(action: {
                            
                        }) {
                            HStack {
                                Text("Search")
                            }
                            .padding()
                            .frame(width: 200, height: 40)
                            .foregroundColor(Color.white)
                            .background(Color.green)
                            .cornerRadius(5)
                        }.disabled(inputNumber == "")
                        
                        Button(action: {
                            
                        }) {
                            HStack {
                                Text("Get random trivia")
                            }
                            .padding()
                            .frame(width: 200, height: 40)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .cornerRadius(5)
                        }.disabled(inputNumber == "")
                    }
                    Spacer()
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
