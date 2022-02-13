//
//  AboutUs.swift
//  Cinquo Photography
//
//  Created by Luis Leal on 25/11/21.
//

import SwiftUI

struct AboutUs: View {
    
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
                    ContentAboutUs(showMenu: self.$showMenu)
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
            .navigationBarTitle("Sobre Nosotros",displayMode: .inline)
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


//Contenido en vista
struct ContentAboutUs : View{
    
    @Binding var showMenu : Bool
    
    var body: some View{
        ScrollView(.vertical){
            VStack{
                TitleAboutUs()
                History()
                ImageCinquo()
                WeBelieveIn()
                Briefcase()
            }
        }
    }
}


struct TitleAboutUs : View{
    var body: some View{
        VStack{
            Text("Nuestra historia")
                .font(.largeTitle)
                .fontWeight(.semibold)
        }.frame(width: 350, height: 40, alignment: .center)
            .padding(.top,5)
    }
}

struct History : View{
    var body: some View{
        VStack{
            Text("Siempre nos hemos caracterisado por querer capturar los mejores momentos en una fotografía en un vídeo, estamos completamente comprometidos en brindarte una de las mejores experiencias en tus eventos u ocasiones especiales. Desde nuestros inicios siempre hemos querido poder posicionarnos como uno de los mejores estudios de fotografía del estado de Nuevo León y de México. ")
                .padding(.horizontal,20)
                .multilineTextAlignment(.leading)
        }.multilineTextAlignment(.center)
            .padding(.top,10)
    }
}

struct ImageCinquo : View{
    var body: some View{
        Image("estudio_fotografia_cinquo")
            .resizable()
            .frame(width: 350, height: 250, alignment: .center)
            .cornerRadius(20)
    }
}

struct WeBelieveIn : View{
    var body: some View{
        VStack{
            Text("En que creemos")
                .font(.largeTitle)
                .fontWeight(.semibold)
        }.frame(width: 350, height: 40, alignment: .center)
            .padding(.top,5)
        VStack{
            Text("Nuestra filosofía siempre ha sido trabajar con profesionalismo y rapidez para así poder brindar solucioines a cada una de las necesidades de nuestros clientes. El profesionalismo, la eficacia y la calidad, son los motores que impulsan este gran proyecto fotográfico.")
                .padding(.horizontal,20)
                .multilineTextAlignment(.leading)
        }
    }
}

struct Briefcase : View{
    var body: some View{
        VStack{
            Text("Portafolio")
                .font(.largeTitle)
                .fontWeight(.semibold)
        }.frame(width: 350, height: 40, alignment: .center)
            .padding(.top,5)
        VStack{
            NavigationLink(destination: BriefcaseWeeding()){
                //Portafolio de Bodas
                VStack{
                    Image("boda")
                        .resizable()
                        .frame(width: 350, height: 250, alignment: .center)
                        .cornerRadius(20)
                    Text("Bodas")
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 30, alignment: .center)
                }
            }
            
            NavigationLink(destination: BriefcaseXV()){
                VStack{
                    //Portafolio de Quinceaños
                    Image("quinceañera")
                        .resizable()
                        .frame(width: 350, height: 250, alignment: .center)
                        .cornerRadius(20)
                    Text("XV´s")
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 30, alignment: .center)
                }
            }
            
            NavigationLink(destination: BriefcasePrenatal()){
                VStack{
                    //Portafolio Prenatal
                    Image("prenatal")
                        .resizable()
                        .frame(width: 350, height: 250, alignment: .center)
                        .cornerRadius(20)
                    Text("Prenatal")
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 30, alignment: .center)
                }
            }
        }
        
    }
}

//Lista de portafolio de bodas
struct BriefcaseWeeding : View{
    var body: some View{
        ScrollView(.vertical){
            ForEach(1..<10){i in
                Image("boda\(i)")
                    .resizable()
                    .frame(width: 350, height: 250, alignment: .center)
                    .cornerRadius(20)
            }
        }
    }
}

//Lista de portafolio de quinceañera
struct BriefcaseXV : View{
    var body: some View{
        ScrollView(.vertical){
            ForEach(1..<9){i in
                Image("xv\(i)")
                    .resizable()
                    .frame(width: 350, height: 250, alignment: .center)
                    .cornerRadius(20)
            }
        }
    }
}

//Lista de portafolio de quinceañera
struct BriefcasePrenatal : View{
    var body: some View{
        ScrollView(.vertical){
            ForEach(1..<6){i in
                Image("prenatal\(i)")
                    .resizable()
                    .frame(width: 350, height: 250, alignment: .center)
                    .cornerRadius(20)
            }
        }
    }
}



struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs()
    }
}
