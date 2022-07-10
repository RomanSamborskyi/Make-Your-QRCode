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
                    else if self.index == 0 {
                        QRGallery()
                            
                    }
                    else if self.index == 2{
                        SettingsView()
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
               Spacer()
            Button{
                withAnimation {
                    self.indexx = 0
                }
            }label: {
                    Image(systemName: "house.fill")
                    .labelStyle(.iconOnly)
                    .imageScale(.large)
                     .scaleEffect(1.5)
                
            }.padding()
                
                    Spacer()
            Button{
                withAnimation {
                    self.indexx = 1
                }
                }label:{
                   Image(systemName: "qrcode")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                         .scaleEffect(1.5)
                        
                }.padding()
                     Spacer()
            
            Button{
                withAnimation {
                    self.indexx = 2
                }
            }label: {
                Image(systemName:"gearshape")
                    .labelStyle(.iconOnly)
                    .imageScale(.large)
                    .scaleEffect(1.5)
            }.padding()
            Spacer()
    }
  }
}
