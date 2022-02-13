//
//  MenuItems.swift
//  Cinquo Photography
//
//  Created by Luis Leal on 25/11/21.
//

import SwiftUI

struct MenuItems: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Button(action: goToIndex){
                    Text("Inicio")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }.padding(.top,100)
            HStack{
                Button(action: goToAboutUs){
                    Text("Sobre nosotros")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }.padding(.top,30)
            HStack{
                Button(action: goToCourses){
                    Text("Cursos")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }.padding(.top,30)
            HStack{
                Button(action: goToLogin){
                    Text("Salir")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }.padding(.top,30)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
    }
}

  

//Ir a la pantalla inicial
func goToIndex(){
    if let window = UIApplication.shared.windows.first{
        window.rootViewController = UIHostingController(rootView: Home())
        window.makeKeyAndVisible()
    }
}

//Ir a la pantalla Sobre nosotros
func goToAboutUs(){
    if let window = UIApplication.shared.windows.first{
        window.rootViewController = UIHostingController(rootView: AboutUs())
        window.makeKeyAndVisible()
    }
}

//Ir a la pantalla de Cursos
func goToCourses(){
    if let window = UIApplication.shared.windows.first{
        window.rootViewController = UIHostingController(rootView: Courses())
        window.makeKeyAndVisible()
    }
}

//Ir a la pantalla de Login
func goToLogin(){
    if let window = UIApplication.shared.windows.first{
        window.rootViewController = UIHostingController(rootView: ContentView())
        window.makeKeyAndVisible()
    }
}


struct MenuItems_Previews: PreviewProvider {
    static var previews: some View {
        MenuItems()
    }
}
