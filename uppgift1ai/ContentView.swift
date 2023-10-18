//
//  ContentView.swift
//  uppgift1ai
//
//  Created by oscar gynning on 2023-09-26.
//
import Vision
import SwiftUI


struct ContentView: View {
    @State var ProbailityText = [Any]()
    
    
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        
        
        VStack {
            Text("Uppgift 4")
            
            HStack{
                
                Spacer()
                
                VStack{
                    
                    
                    Image("dog")
                        .resizable()
                        .frame(width:100 ,height: 100)
                    Button {
                        ProbailityText = viewModel.doImage(Picture: "dog")
                    } label: {
                        Text("DOG")
                    }
                  
                }
                
                Spacer()
                
                VStack{
                    
                    Image("cat")
                        .resizable()
                        .frame(width:100 ,height: 100)
                    
                    Button {
                        ProbailityText =  viewModel.doImage(Picture: "cat")
                    } label: {
                        Text("CAT")
                    }
                    
                   
                }
                
                Spacer()
            }
            .padding(.top)
            
          
                   ForEach(0..<ProbailityText.count, id: \.self) { index in
                       if let element = ProbailityText[index] as? String {
                           
                           Text(element)
                               .padding()
                       } else if let element = ProbailityText[index] as? Double {
                           Text("\(element)")
                           
                               .padding()
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
