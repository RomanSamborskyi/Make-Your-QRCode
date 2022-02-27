//
//  ContentView.swift
//  Animation carusel
//
//  Created by Roman Samborskyi on 26.11.2021.
//

import SwiftUI

struct QRGallery: View {
    var body: some View {
      Home()
          
    }
}

struct QRGallery_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
struct Home : View {
    @State var data = [Card(id: 0, img: " ", name: " ", show: false),
                       Card(id: 1, img: " ", name: " ", show: false),
                       Card(id: 2, img: " ", name: " ", show: false),
                       Card(id: 3, img: " ", name: " ", show: false),
                       Card(id: 4, img: " ", name: " ", show: false)
    ]

    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 30
    var body : some View {
    NavigationView{
        
        VStack{
          Spacer()
              
            HStack(spacing: 15){
                ForEach(data){i in
                    
                    CardView(data: i)
                        .offset(x:self.x)
                        .highPriorityGesture(DragGesture()
                        
                        .onChanged({ (value) in
                            if value.translation.width > 0 {
                                self.x = value.location.x
                            }
                            else{
                                self.x = value.location.x - self.screen
                            }
                        })
                        .onEnded({ (value) in
                            if value.translation.width > 0 {
                                if value.translation.width > ((screen - 80) / 2) && Int(self.count) != self.getMid(){
                                    self.count += 1
                                    self.updateHeight(value: Int(self.count))
                                    self.x = (screen + 15)*self.count
                                }else{
                                    self.x = (screen + 15)*self.count
                                }
                            }
                            else{
                                if -value.translation.width > ((screen - 80) / 2) && -Int(self.count) != self.getMid(){
                                    self.count -= 1
                                    self.updateHeight(value: Int(self.count))
                                    self.x = (screen + 15)*self.count
                                }else{
                                    self.x = (screen + 15)*self.count
                                }
                            }
                        })
                                             )
                }
            }
            
            Spacer()
        }
        .background(Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)).navigationTitle("QR Gallery")
        .animation(.spring())
        .onAppear{
            self.data[self.getMid()].show = true
                
        }
    }
}
    func getMid()->Int{
        return data.count / 2
    }
    
    func updateHeight(value : Int){
        var id : Int
        if value < 0{
            id = -value + getMid()
        }
        else{
            id = getMid() - value
        }
        for i in 0..<data.count{
            data[i].show = false
        }
        data[id].show = true
    }
}
struct CardView : View {
    var data : Card
    var body: some View{
        VStack(alignment: .leading, spacing: 0){
            Image(data.img)
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 30, height: data.show ? 460 : 400)
                
            Text(data.name)
                .fontWeight(.bold)
                .padding(.vertical, 13)
                .padding(.leading)
                
        }.cornerRadius(25)
        
    }
}
struct Card : Identifiable {
    var id : Int
    var img : String
    var name : String
    var show : Bool
    
}
