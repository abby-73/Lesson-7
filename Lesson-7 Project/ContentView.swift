//
//  ContentView.swift
//  Lesson-7 Project
//
//  Created by Abigail Lau on 27/8/23.
//

import SwiftUI

struct supply: Identifiable, Hashable{
    var id = UUID()
    var title: String
    var amount: Int
}

struct ContentView: View {
    @State var Title = ""
    @State var amount = 0
    @State private var item: [supply] = [
        .init(title: "Coffee", amount: 17),
        .init(title: "Tea", amount: 18)
    ]
    @State var isActive : Bool = false
    
    var body: some View{
        NavigationView{
            
            VStack{
                List{
                    ForEach(item) {i in
                        Text("\(i.title) \n \(i.amount)")
                        
                    }
                }
                NavigationLink(
                    destination: NewItem(titleText: $Title, amountText: $amount, Item: $item, goBackToRoot: self.$isActive),
                    isActive: self.$isActive
                ) {
                    Text("+")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                }
                .isDetailLink(false)
                .navigationTitle("Supply")
                .navigationBarTitleDisplayMode(.large)
                
                
            }
        }
    }
    
}

//                .contextMenu{
//                    Button(role:.destructive){
//                        print("Delete")
//
//                    } label: {
//                        Text("Delete")
//                        Spacer()
//                        Image(systemName: "trash")
//
//
//                    }
//                }



    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    

