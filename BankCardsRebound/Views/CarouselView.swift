//
//  CarouselView.swift
//  BankCardsRebound
//
//  Created by Raphael Cerqueira on 31/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct CarouselView: View {
    @State var currentPage: Int = 0
    private let pageWidth: CGFloat = 256 // 240 height + 16 spacing
    @State var xOffset: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                ForEach(0 ..< colorsData.count) { item in
                    CardView(colors: colorsData[item])
                }
            }
            .padding(.top)
            .offset(x: self.xOffset)
            .gesture(DragGesture()
            .onChanged { value in
                self.xOffset = self.offsetForTranslation(value.translation.width)
            }
            .onEnded { value in
                self.currentPage = self.indexForTranslation(self.xOffset + value.translation.width)
                withAnimation(.spring()) {
                    self.xOffset = self.offsetForTranslation()
                }
            })
            
            HStack(spacing: 4) {
                Circle()
                    .fill(self.currentPage == 0 ? Color(#colorLiteral(red: 0.3273854554, green: 0.3236509562, blue: 0.4107028842, alpha: 1)) : Color(#colorLiteral(red: 0.9234262705, green: 0.9164488912, blue: 0.9733310342, alpha: 1)))
                    .frame(width: 6, height: 6)
                Circle()
                    .fill(self.currentPage == 1 ? Color(#colorLiteral(red: 0.3273854554, green: 0.3236509562, blue: 0.4107028842, alpha: 1)) : Color(#colorLiteral(red: 0.9234262705, green: 0.9164488912, blue: 0.9733310342, alpha: 1)))
                    .frame(width: 6, height: 6)
                Circle()
                    .fill(self.currentPage == 2 ? Color(#colorLiteral(red: 0.3273854554, green: 0.3236509562, blue: 0.4107028842, alpha: 1)) : Color(#colorLiteral(red: 0.9234262705, green: 0.9164488912, blue: 0.9733310342, alpha: 1)))
                    .frame(width: 6, height: 6)
                Circle()
                    .fill(self.currentPage == 3 ? Color(#colorLiteral(red: 0.3273854554, green: 0.3236509562, blue: 0.4107028842, alpha: 1)) : Color(#colorLiteral(red: 0.9234262705, green: 0.9164488912, blue: 0.9733310342, alpha: 1)))
                    .frame(width: 6, height: 6)
            }
            .padding()
        }
        .onAppear {
            self.xOffset = self.offsetForIndex(self.currentPage)
        }
    }
    
    func indexForTranslation(_ translation: CGFloat) -> Int {
        let logical = (translation - ((CGFloat(colorsData.count) * self.pageWidth) / 2)) * -1
        
        let float = logical / self.pageWidth
        
        var index = Int(round(float))
        index = max(index, 0)
        return min(index, colorsData.count - 1)
    }
    
    func offsetForTranslation(_ translation: CGFloat = .zero) -> CGFloat {
        return self.offsetForIndex(self.currentPage, translation: translation)
    }
    
    func offsetForIndex(_ index: Int, translation: CGFloat = .zero) -> CGFloat {
        let pageOffset = CGFloat(index) * self.pageWidth
        let leadingOffset = ((CGFloat(colorsData.count) * self.pageWidth) / 2) - (self.pageWidth / 2)
        return (leadingOffset - pageOffset) + translation
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
