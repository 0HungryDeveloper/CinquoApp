//
//  Courses.swift
//  Cinquo Photography
//
//  Created by Luis Leal on 25/11/21.
//

import SwiftUI

struct Courses: View {
    
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
                    ContentCourses(showMenu: self.$showMenu)
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
            .navigationBarTitle("Cursos",displayMode: .inline)
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
struct ContentCourses : View{
    
    @Binding var showMenu : Bool
    
    var body: some View{
        ScrollView(.vertical){
            VStack{
                TitleView()
                BannerCourses()
            }
        }
    }
}


struct TitleView : View{
    var body: some View{
        VStack{
            Text("Nuestros Cursos")
                .font(.title3)
                .fontWeight(.light)
        }.frame(width: 350, height: 40, alignment: .topLeading)
            .padding(.top,5)
    }
}


struct BannerCourses : View{
    var body: some View{
        VStack{
            BeginnersCourse()
            IntermediateCourse()
            AdvancedCourse()
        }
    }
}

struct BeginnersCourse : View{
    var body: some View{
        VStack{
            NavigationLink(destination: PrincipiantVideosView()){
                VStack{
                    Image("curso1")
                        .resizable()
                        .frame(width: 350, height: 250, alignment: .center)
                        .cornerRadius(12)
                    Text("Curso para principiantes")
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 30, alignment: .center)
                }
            }
        }
    }
}

struct PrincipiantVideos : Identifiable{
    let id = UUID()
    let title : String
    let url : String
}

struct PrincipiantVideosView : View{
    
    private let principiantVideos : [PrincipiantVideos] = [
        PrincipiantVideos(
            title: "Curso básico de fotografía Lección 1", url: "1qvDPi9ZyJA"
        ),
        PrincipiantVideos(
            title: "Curso básico de fotografía Lección 2", url: "fv7F2Rei5P8"
        ),
        PrincipiantVideos(
            title: "Curso básico de fotografía Lección 3", url: "mOgdVIouztU"
        ),
        PrincipiantVideos(
            title: "Curso básico de fotografía Lección 4", url: "-Nh7K6fAg7A"
        ),
        PrincipiantVideos(
            title: "Curso básico de fotografía Lección 5", url: "bRitwgMdvaU"
        ),
        PrincipiantVideos(
            title: "Curso básico de fotografía Lección 6", url: "dB-fue-LNTk"
        ),
        PrincipiantVideos(
            title: "Curso básico de fotografía Lección 7", url: "UH23bYgIVIA"
        ),
        PrincipiantVideos(
            title: "Curso básico de fotografía Lección 8", url: "P28jKZyGbvc"
        ),
        PrincipiantVideos(
            title: "Curso básico de fotografía Lección 9", url: "NCLyPloH21A"
        ),
        PrincipiantVideos(
            title: "Curso básico de fotografía Lección 10", url: "THP1DKQQq9w"
        ),
        PrincipiantVideos(
            title: "Curso básico de fotografía Lección 11", url: "ME9HsfeEelc"
        ),
        PrincipiantVideos(
            title: "Curso básico de fotografía Lección 12", url: "K7-LANraQ28"
        )
    ]
    
    var body: some View{
        VStack{
            Text("Nivel Principiante")
                .font(.largeTitle)
                .fontWeight(.light)
        }.frame(width: 350, height: 40, alignment: .center)
            .padding(.top,5)
        List(principiantVideos){video in
            NavigationLink(destination: VideoTip(videoID: video.url)
                    .frame(minHeight:0, maxHeight: UIScreen.main.bounds.height * 0.3)
                    .cornerRadius(12)
                            .padding(.horizontal,24)){
                HStack{
                    Image(systemName: "play")
                    Text(video.title)
                }
            }
        }
    }
}


struct IntermediateCourse : View{
    var body: some View{
        VStack{
            NavigationLink(destination: IntermediateVideosView()){
                VStack{
                    Image("curso2")
                        .resizable()
                        .frame(width: 350, height: 250, alignment: .center)
                        .cornerRadius(12)
                    Text("Curso para fotógrafos intermedios")
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 30, alignment: .center)
                }
            }
        }
    }
}

struct IntermediateVideos : Identifiable{
    let id = UUID()
    let title : String
    let url : String
}


struct IntermediateVideosView : View{
    
    private let intermediateVideos : [IntermediateVideos] = [
        IntermediateVideos(title: "Introducción", url: "c2_yeKn7QPQ"),
        IntermediateVideos(title: "Partes Externas", url: "Qci_dN5st5U"),
        IntermediateVideos(title: "Partes Internas", url: "toOypy760UI"),
        IntermediateVideos(title: "Obturador", url: "iP7oYFiC9-s"),
        IntermediateVideos(title: "Apertura", url: "amIa1hapswc"),
        IntermediateVideos(title: "Sensibilidad ISO", url: "_p5Cr27r1Y0"),
        IntermediateVideos(title: "Balance de blancos", url: "2q-Up7veGgw"),
        IntermediateVideos(title: "Modos de disparo", url: "qnbqKvJnQ5o")
    ]
    
    var body: some View{
        VStack{
            Text("Nivel Intermedio")
                .font(.largeTitle)
                .fontWeight(.light)
        }.frame(width: 350, height: 40, alignment: .center)
            .padding(.top,5)
        List(intermediateVideos){video in
            NavigationLink(destination: VideoTip(videoID: video.url)
                    .frame(minHeight:0, maxHeight: UIScreen.main.bounds.height * 0.3)
                    .cornerRadius(12)
                            .padding(.horizontal,24)){
                HStack{
                    Image(systemName: "play")
                    Text(video.title)
                }
            }
        }
    }
}


struct AdvancedCourse : View{
    var body: some View{
        VStack{
            NavigationLink(destination: AdvancedVideosView()){
                VStack{
                    Image("curso3")
                        .resizable()
                        .frame(width: 350, height: 250, alignment: .center)
                        .cornerRadius(12)
                    Text("Curso para fotógrafos avanzados")
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 30, alignment: .center)
                }
            }
        }
    }
}

struct AdvancedVideos : Identifiable{
    let id = UUID()
    let title : String
    let url : String
}

struct AdvancedVideosView : View{
    
    private let advancedVideos : [AdvancedVideos] = [
        AdvancedVideos(title: "La interfaz, abrir imágenes, preferencias", url: "3B9mHjLkiHY"),
        AdvancedVideos(title: "Abrir y procesar archivos raw", url: "PlZ2KEPPn-A"),
        AdvancedVideos(title: "Trabajar con capas, flujo no destructivo", url: "j7iJcemefMY"),
        AdvancedVideos(title: "Procesado raw selectivo por zonas", url: "FkyWWnSv0UE"),
        AdvancedVideos(title: "Herramientas de retoque automático", url: "JrIRxbZUkqo"),
        AdvancedVideos(title: "Conversión a blanco y negro", url: "E7eousqPyDI"),
        AdvancedVideos(title: "Selecciones y máscaras para retoque por zonas", url: "8sxAdkblA3A"),
        AdvancedVideos(title: "Panorámicas con Photoshop y ACR", url: "sqCuuFrpM6Q"),
        AdvancedVideos(title: "Recortar y enderezar fotos", url: "zkvcPqT0BgA"),
        AdvancedVideos(title: "Retoque de cara y cuerpo", url: "yoLlZ2orUWU"),
        AdvancedVideos(title: "Desenfoque selectivo del fondo", url: "44CrsQLiaMk"),
        AdvancedVideos(title: "Hacer hojas de contacto", url: "Sx0S8JraaNw"),
        AdvancedVideos(title: "Marcas de agua automáticas", url: "97TSyE2OrTU"),
    ]
    
    var body: some View{
        VStack{
            Text("Nivel Avanzado")
                .font(.largeTitle)
                .fontWeight(.light)
        }.frame(width: 350, height: 40, alignment: .center)
            .padding(.top,5)
        List(advancedVideos){video in
            NavigationLink(destination: VideoTip(videoID: video.url)
                    .frame(minHeight:0, maxHeight: UIScreen.main.bounds.height * 0.3)
                    .cornerRadius(12)
                            .padding(.horizontal,24)){
                HStack{
                    Image(systemName: "play")
                    Text(video.title)
                }
            }
        }
    }
}

struct Courses_Previews: PreviewProvider {
    static var previews: some View {
        Courses()
    }
}
