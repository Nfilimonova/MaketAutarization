//
//  ContentView.swift
//  MaketAutarization
//
//  Created by user on 04.06.2021.
//

import SwiftUI


struct SignInView: View {
    @State var email = ""
    @State var pass = ""
    @ObservedObject var userObjact = UserObjact ()
    @Binding var page: Int
    
    var body: some View {
        VStack{
            
            Image("Glogo")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 183, height: 183, alignment: .center)
            
               
        Text("EMAIL")
            .frame(width: 350, height: nil, alignment: .leading)
            .font(.custom("Arial-ExtraBold", size: 13))
            .padding(.top,10)
          
                HStack{
                Image (systemName: "envelope")  .foregroundColor(.gray)
                    .padding()
                TextField("name@email.com", text: $email).padding(.horizontal)
                }
                .overlay(RoundedRectangle(cornerRadius: 8) .stroke(Color(UIColor.gray).opacity(1),lineWidth: 1))
                .padding(.horizontal, 20)
                
       
        Text("PASSWORD").font(.custom("Arial-ExtraBold", size: 13))
            .frame(width: 350, height: nil, alignment: .leading)
            .padding(.top,10)
                HStack{
                    Image(systemName: "lock")  .foregroundColor(.gray)
                        .padding()
            SecureField("**********", text: $pass).padding(.horizontal)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            }
                .overlay(RoundedRectangle(cornerRadius: 8) .stroke(Color(UIColor.gray).opacity(1),lineWidth: 1))
                .padding(.horizontal,20)
            
            Button(action: {
               
                userObjact.login(email: email, password: pass)
                page = 2
               
            }, label: {
                Text("SIGN IN")
                    .font(.custom("Arial", size: 12))
                    .foregroundColor(.white)
                    .frame(width: 290, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color(.blue))
                    .border(Color(.blue), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    .padding()
            })
            HStack{
            Text("Already have an accaunt?")
                .font(.custom("Arial", size: 13))
                .foregroundColor(.gray)
            Text("Login")
                .font(.custom("Arial", size: 13))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(page: .constant(1))
    }
}
