//
//  DetailView.swift
//  shoppingApp
//
//  Created by Daniel on 15.11.2022.
//

import SwiftUI

struct RoundedCornerShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

struct Counter: View {
    @State var count = 0
    
    var body: some View {
        HStack(spacing: 25) {
            Button {
                if count < 10 {
                    count += 1
                }
            } label: {
                Image(systemName: "plus")
            }
            Text("\(count)")
                .font(.title)
            Button {
                if count != 0 {
                    count -= 1
                }
            } label: {
                Image(systemName: "minus")
            }
        }
        .foregroundColor(.black)
        .frame(width: 130, height: 50)
        .background(Color("bgColor").opacity(0.15))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
struct DetailView: View {
    @State var fruit: fruitTitle
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 25) {
                Image("bg")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .clipShape(RoundedCornerShape(corners: [.bottomLeft, .bottomRight], radius: 50))
                    .frame(width: .infinity, height: .infinity, alignment: .top)
                    .edgesIgnoringSafeArea(.all)
                    .shadow(color: .gray, radius: 5, x: 5, y: 5)
                    .overlay(
                        Image(fruit.rawValue)
                            .resizable()
                            .frame(width: 250, height: 230)
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                            .offset(y: 20)
                    )
               Spacer(minLength: 50)
                Text("\(fruit.rawValue) - Medium")
                    .fontWeight(.medium)
                    .font(.title)
                    .padding(.horizontal)
                    .textCase(.uppercase)
                Text("Each (500 - 700g)")
                    .padding(.horizontal)
                Text("Organic agriculture is intended to produce high quality, nutritious food that contributes to preventive health care and well-being. In view of this, it avoids the use of fertilizers, pesticides, animal drugs and food additives that may have adverse health effects.")
                    .font(.body)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .lineLimit(6)
                    .padding(.horizontal)
                
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("bgColor"))
                        .opacity(0.15)
                        .overlay(
                          Image(systemName: "hourglass")
                        )
                        .font(.system(size: 40))
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Delivery time")
                        Text("25 - 30 Min")
                    }
                }
                .padding(.horizontal)
                
                HStack {
                    Text("$1.99")
                        .fontWeight(.medium)
                        .font(.title)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                   Counter()
                }
                Image("bg")
                    .resizable()
                    .frame(width: 350, height: 50, alignment: .center)
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 5, x: 5, y: 5)
                    .overlay(
                      Text("Add to cart")
                        .font(.title3)
                        .fontWeight(.medium)
                    )
                    .padding(.horizontal)
                Spacer()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(fruit: .orange)
    }
}
