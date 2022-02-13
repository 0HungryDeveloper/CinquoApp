//
//  Home.swift
//  Cinquo Photography
//
//  Created by Luis Leal on 25/11/21.
//

import SwiftUI

struct Home: View {
    
    @State var showMenu = false
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded{
                if($0.translation.width < -100){
                    withAnimation{
                        self.showMenu = false
                    }
                }
            }
        return NavigationView{
            GeometryReader{ geometry in
                ZStack(alignment: .leading){
                    CurrentScreenIndex(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    
                    if(self.showMenu){
                        MenuItems()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
            //Menú bar
            .navigationBarTitle(Text("Inicio"),displayMode: .inline)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation{
                        self.showMenu.toggle()
                    }
                }){
                    Image(systemName: "line.horizontal.3")
                }
            ))
        }
    }
}


struct Card {
    var id : Int
    let titleCard : String
    let image : String
    let videoID : String
}


//Contenido en vista
struct CurrentScreenIndex : View{
    
    @Binding var showMenu : Bool
    
    //Arreglo de tartejas de contenido
    let cards:[Card] = [
        Card(id: 0, titleCard: "5 Consejos para hacer fotos con el móvil",image: "1", videoID: "EAGa45AMXOQ"),
        Card(id: 1, titleCard: "Consejos para cuidar tu cámara", image: "2", videoID: "Ok2V-VCi0jY"),
        Card(id: 2, titleCard:"Consejos para fotógrafos principiantes", image: "3", videoID: "XYgYdB8wJK8"),
        Card(id: 3, titleCard: "Ejercicios fotográficos para mejorar en fotografía", image: "4", videoID: "RYkW1Bym1t8"),
        Card(id: 4, titleCard: "Distancia focal en retratos", image: "5", videoID: "hEua1qCIH8k")
    ]
    
    var body: some View{
        ScrollView(.vertical){
            VStack{
                Text("Consejos")
                    .font(.title3)
                    .fontWeight(.light)
            }.frame(width: 350, height: 40, alignment: .topLeading)
                .padding(.top,5)
            //Contenido
            VStack{
                ForEach(cards, id: \.id){card in
                    NavigationLink(destination: VideoTip(videoID: card.videoID)
                                    .frame(minHeight:0, maxHeight: UIScreen.main.bounds.height * 0.3)
                                    .cornerRadius(12)
                                    .padding(.horizontal,24)){
                        CardView(card: card)
                    }
                }
            }
        }
    }
}

//Vista de una tarjeta
struct CardView : View{
    
    let card : Card
    
    var body: some View{
        VStack{
            Image(card.image)
                .resizable()
                .frame(width:350,height: 250)
                .cornerRadius(20)
            Text(card.titleCard)
                .foregroundColor(.black)
                .font(.headline)
                .fontWeight(.light)
                .frame(width: 350, height: 30, alignment: .leading)
        }.padding(4)
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home()
                .previewInterfaceOrientation(.portraitUpsideDown)
            Home()
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}
