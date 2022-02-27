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
            Button(action:{
                self.indexx = 0
    
                    }) {
                Image("GalleryPng")
                            .padding()
                            .frame(width: 48.0, height: 48.0)
                            
            }
                    Spacer()
            Button(action:{
                self.indexx = 1
                    }) {
                        Image("QRpng")
                            .padding()
                            .frame(width: 48.0, height: 48.0)
            }
            
                     Spacer()
            
            Button(action:{
                self.indexx = 2
                    }) {
                        Image("SettingsPng")
                            .padding()
                            .frame(width: 48.0, height: 48.0)
                           
        }
            Spacer()
    }
  }
}
