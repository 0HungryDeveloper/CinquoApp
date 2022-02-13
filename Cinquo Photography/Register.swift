//
//  Register.swift
//  Cinquo Photography
//
//  Created by Luis Leal on 25/11/21.
//

import SwiftUI

struct Register: View {
    
    //Campos de usuario y contraseña
    @State var username : String = ""
    @State var mail : String = ""
    @State var password : String = ""
    
    var body: some View {
        VStack{
            TitleScreen()
            TextField("Usuario",text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom,20)
            
            TextField("Correo",text: $mail)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom,20)
            SecureField("Contraseña", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom,20)
            Button(action: createAccount){
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
            Button(action: goBack){
                HStack(alignment: .center){
                    Spacer()
                    Text("Volver")
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


struct TitleScreen : View{
    var body: some View{
        Text("Registrate")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom,20)
    }
}


func createAccount(){
    if let window = UIApplication.shared.windows.first{
        window.rootViewController = UIHostingController(rootView: Home())
        window.makeKeyAndVisible()
    }
}

func goBack(){
    if let window = UIApplication.shared.windows.first{
        window.rootViewController = UIHostingController(rootView: ContentView())
        window.makeKeyAndVisible()
    }
}


struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
