//
//  FruitCardView.swift
//  shoppingApp
//
//  Created by Daniel on 15.11.2022.
//

import SwiftUI

let images: FruitModel = FruitModel(id: 1, title: .orange, image: "orange", price: "3.44$", color: "1")

struct FruitCardView: View {
    let fruits: FruitModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 5) {
        
                
                Text(fruits.title.rawValue)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text(fruits.price)
                    .font(.title3)
                    .foregroundColor(.black.opacity(0.7))
                  Spacer()
            }
            .padding()
            .frame(width: 175, height: 150, alignment: .center)
            .background(Color(fruits.color))
            .cornerRadius(30)
            .padding()
            
            ZStack {
                Image(fruits.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 110)
            }
            .offset(y: 60)
        }
        .frame(width: 175, height: 250, alignment: .center)
        .shadow(color: .gray, radius: 5, x: 5, y: 5)
    }
}

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruits: images)
    }
}
