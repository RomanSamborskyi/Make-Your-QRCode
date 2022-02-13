//
//  TabBar.swift
//  Make Your QR
//
//  Created by Roman Samborskyi on 13.02.2022.
//

import SwiftUI

struct TabBar: View {
    @State var index = 0
    
    var body: some View {
        VStack(spacing:0){
            
            VStack{
               Spacer()
                
                ZStack{
                    
                if self.index == 1 {
                   
                ContentView()
                }
           
                }
                CustomBar(indexx: self.$index)
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            
    }
}

struct CustomBar : View {
    
    @Binding var indexx : Int
    
    var body: some View {
        HStack{
            Button(action:{
                self.indexx = 0
    
                    }) {
                Image("HomePng")
                            .padding()
                            .frame(width: 64.0, height: 64.0)
                            
            }
            
            Button(action:{
                self.indexx = 1
                    }) {
                        Image("QRpng")
                            .padding()
                            .frame(width: 64.0, height: 64.0)
            }
            
            
            Button(action:{
                self.indexx = 2
                    }) {
                        Image("SettingsPng")
                            .padding()
                            .frame(width: 64.0, height: 64.0)
                           
        }
    }
  }
}
