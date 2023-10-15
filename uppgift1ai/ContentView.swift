//
//  ContentView.swift
//  uppgift1ai
//
//  Created by oscar gynning on 2023-09-26.
//

import SwiftUI

struct ContentView: View {
    
    @State var fruker = ["apelsin" , "banan", "äpple"]
    var body: some View {
        
        
        NavigationStack{
            VStack {
                Text("Uppgift 3")
                
                HStack{
                    List(fruker, id: \.self ){frukt in
                        
                        NavigationLink(destination: Text(frukt)){
                            InfoView(frukten: frukt)
                        }
                    
                    }
                }
                .padding(.top)
                
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
