//
//  ContentView.swift
//  BankCardsRebound
//
//  Created by Raphael Cerqueira on 31/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "arrow.left")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(#colorLiteral(red: 0.1605144441, green: 0.1498959661, blue: 0.2626175284, alpha: 1)))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image("timcook")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    .buttonStyle(PlainButtonStyle())
                    }
                    
                    Text("Bank Cards")
                        .font(.system(size: 36, weight: .heavy))
                        .foregroundColor(Color(#colorLiteral(red: 0.1605144441, green: 0.1498959661, blue: 0.2626175284, alpha: 1)))
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    Text("Date issued")
                        .foregroundColor(Color(#colorLiteral(red: 0.7737134099, green: 0.7714089751, blue: 0.8325663209, alpha: 1)))
                        .padding(.top, 64)
                    
                    Text("22/08/2020")
                        .font(.system(size: 18, weight: .black))
                        .foregroundColor(Color(#colorLiteral(red: 0.1605144441, green: 0.1498959661, blue: 0.2626175284, alpha: 1)))
                }
                .padding()
                
                GeometryReader { geometry in
                    CarouselView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
