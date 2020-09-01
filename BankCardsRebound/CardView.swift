//
//  CardView.swift
//  BankCardsRebound
//
//  Created by Raphael Cerqueira on 31/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

let colorsData = [
    [Color(#colorLiteral(red: 0.2319976985, green: 0.6488242745, blue: 0.9459127784, alpha: 1)), Color(#colorLiteral(red: 0.8688952923, green: 0.3678854704, blue: 0.4788374305, alpha: 1))],
    [Color(#colorLiteral(red: 0.3479272723, green: 0.2959536612, blue: 0.4747475982, alpha: 1)), Color(#colorLiteral(red: 0.7398642898, green: 0.2895881534, blue: 0.2722624242, alpha: 1)), Color(#colorLiteral(red: 0.9486190677, green: 0.6836547256, blue: 0.3201493621, alpha: 1))],
    [Color(#colorLiteral(red: 0.417201519, green: 0.39656955, blue: 0.954310596, alpha: 1)), Color(#colorLiteral(red: 0.468162775, green: 0.8612062931, blue: 0.8037278056, alpha: 1))],
    [Color(#colorLiteral(red: 0.9456000924, green: 0.6209636927, blue: 0.6372543573, alpha: 1)), Color(#colorLiteral(red: 0.8712756038, green: 0.8534190059, blue: 0.6482948065, alpha: 1)), Color(#colorLiteral(red: 0.9266901016, green: 0.7523105741, blue: 0.6261904836, alpha: 1))]
]

struct CardView: View {
    var colors: [Color]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Debit card")
                    .font(.system(size: 17))
                
                Spacer()
                
                Image(systemName: "wifi")
                    .font(.system(size: 24))
                    .rotationEffect(Angle(degrees: 90))
            }
            .padding(.top)
            
            Text("5488 **** **** **** 4981")
                .bold()
                .padding(.top, 86)
            
            
            HStack {
                VStack(alignment: .leading) {
                    Text("CARD HOLDER")
                        .font(.system(size: 15))
                        .opacity(0.7)
                    
                    Text("Jonathan Oluwafemi")
                        .bold()
                }
                
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.7))
                        .frame(width: 40, height: 40)
                        .offset(x: -20)
                    
                    Circle()
                        .fill(Color.white.opacity(0.5))
                        .frame(width: 40, height: 40)
                }
            }
        }
        .padding(30)
        .frame(width: 400, height: 240)
        .foregroundColor(Color.white)
        .background(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(40)
        .rotationEffect(Angle(degrees: -90))
        .frame(width: 240, height: 400)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(colors: colorsData[0])
    }
}
