//
//  ContentView.swift
//  Make Your QR
//
//  Created by Roman Samborskyi on 27.01.2022.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var name = "past here"
    @State private var yourAdres = "adres"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    
    var body: some View {
        NavigationView{
            Form{
                TextField("past here", text: $name)
                    .textContentType(.name)
                    .font(.title)
                
                Image(uiImage: generateQRCode(from: "\(name)"))
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
               
            }
            .navigationTitle("Your QRCode")
        }
        
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        if let outputImage = filter.outputImage {
            if let cgimage = context.createCGImage(outputImage, from: outputImage.extent){
                return UIImage(cgImage: cgimage)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
