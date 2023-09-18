//
//  NewItem.swift
//  Lesson-7 Project
//
//  Created by Abigail Lau on 27/8/23.
//

import SwiftUI

struct NewItem: View {
    @Binding var titleText: String
    @Binding var amountText: Int
    @Binding var Item: Array<supply>
    @Binding var goBackToRoot : Bool
    var body: some View {
        NavigationStack{
            VStack{
                
                HStack{
                    Text("Item name:")
                        .fontWeight(.heavy)
                    TextField("Enter name", text: $titleText)
                                                
                }
                
                Stepper("Amount: \(amountText)", value: $amountText)
                    .fontWeight(.heavy)
                
                Button{
                    self.goBackToRoot = false
                    Item.append(supply(title: titleText, amount: amountText))
                    titleText = ""
                    amountText = 0
                
                } label:{
                    Text("Add")
                        .fontWeight(.black)
                    
                }
                
                
            }
                
            
        }
        .navigationTitle("Add an item")
        .navigationBarTitleDisplayMode(.large)
        .padding(.all,70.0)
        .position(x:190,y:170)
            
        }
    }
    
    
    struct NewItem_Previews: PreviewProvider {
        static var previews: some View {
            NewItem(titleText: .constant("7"), amountText: .constant(7), Item: .constant([supply(title: "", amount: 7)]), goBackToRoot: .constant(false))
        }
    }
    

