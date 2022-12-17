//
//  ContentView.swift
//  Shared
//
//  Created by Arun_Skyraan on 08/09/22.
//

import SwiftUI


struct ContentView: View {
    @State var name : String = ""
    @State var email : String = ""
    @State var address : String = ""
    @State var id : String = ""
    @State var payment : Bool = true
    var CoreData = CoreDataManager()
    var body: some View {
        ZStack(){
            Color.secondary
                .ignoresSafeArea()
            VStack(){
                VStack(){
                    Text("Name:")
                        .frame(width: 350,height: 30 ,alignment: .leading)
                        .background(Color.mint)
                        .foregroundColor(.white)
                    TextField("Enter Name ", text : $name)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 35)
                        .background(Color.teal)
                       
                }
//                .padding()
                VStack(){
                    Text("ID:")
                        .frame(width: 350,height: 30 ,alignment: .leading)
                        .background(Color.mint)
                        .foregroundColor(.white)

                    TextField("Enter Id ", text : $id)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 35)
                        .background(Color.teal)
                }
//                .padding()
                VStack(){
                    Text("Email:")
                        .frame(width: 350,height: 30 ,alignment: .leading)
                        .background(Color.mint)
                        .foregroundColor(.white)

                    TextField("Name ", text : $email)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 35)
                        .background(Color.teal)
                }
//                .padding()
                VStack(){
                    Text("Address:")
                        .frame(width: 350,height: 30 ,alignment: .leading)
                        .background(Color.mint)
                        .foregroundColor(.white)

                    TextField("Name ", text : $address)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 35)
                        .background(Color.teal)
                }
//                .padding()
                HStack(){
                    Toggle(isOn: $payment, label: {
                        Text("Salary:")
                            .foregroundColor(.mint)
                    })
                }
//                .padding()
                
                
                HStack(){
                    Button(action: {
                        
                        CoreData.savaDetails(name: name, email: email, id: 2, address: address, payment: payment)
                       
                    }, label: {
                        Text("SUBMIT")
                    })
                    .frame(width: 80, height: 50)
                    .foregroundColor(.white)
                    .background(Color.mint)
                    .padding()
                    NavigationLink(destination: {
                        DataDetails()
                    }, label: {
                        Text("GET DATA")
                    })
                    .frame(width: 90, height: 50)
                    .foregroundColor(.white)
                    .background(Color.mint)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
