//
//  ContentView.swift
//  Cinquo Photography
//
//  Pantalla para iniciar sesión
//
//

import SwiftUI

let lightGreyColor = Color(red : 239.0/255.0, green : 243.0/255.0, blue : 244.0/255.0)

struct ContentView: View {
    
    //Campos de usuario y contraseña
    @State var username : String = ""
    @State var password : String = ""
    
    var body: some View {
        VStack{
            TitleApp()
            ImageApp()
            TextField("Usuario",text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom,20)
            SecureField("Contraseña", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom,20)
            
            Button(action: goToPrincipalScreen){
                HStack(alignment: .center){
                    Spacer()
                    Text("Inicia sesión")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.black)
                        .cornerRadius(35.0)
                    Spacer()
                }
            }
            
            Button(action: goToRegisterScreen){
                HStack(alignment: .center){
                    Spacer()
                    Text("Crear cuenta")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.black)
                        .cornerRadius(35.0)
                    Spacer()
                }
            }
                
        }
    }
}

struct TitleApp : View{
    var body: some View{
        Text("Cinquo")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom,20)
    }
}


struct ImageApp : View{
    var body: some View{
        Image("CinquoIcon")
            .frame(width: 150, height: 170)
            .padding(.bottom,80)
    }
}

func goToPrincipalScreen(){
    if let window = UIApplication.shared.windows.first{
        window.rootViewController = UIHostingController(rootView: Home())
        window.makeKeyAndVisible()
    }
}

func goToRegisterScreen(){
    if let window = UIApplication.shared.windows.first{
        window.rootViewController = UIHostingController(rootView: Register())
        window.makeKeyAndVisible()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
