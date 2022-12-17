//
//  MyStructFile.swift
//  JSONparsing
//
//  Created by Arun_Skyraan on 14/09/22.
//

import SwiftUI

struct MyStruct: Decodable,Identifiable {
    
    var id : Int
    var name : String
    var email : String
    var username : String
    var address : myAddress
    var phone : String
    var website : String
    var company : myCompany
    
}

struct myAddress : Decodable{
    var street : String
    var suite : String
    var city : String
    var zipcode : String
    var geo : myGeo
}

struct myGeo: Decodable {
    var lat : String
    var lng : String
}
struct myCompany: Decodable {
    var name : String
    var catchPhrase : String
    var bs : String
}

//struct MyStructFile_Previews: PreviewProvider {
//    static var previews: some View {
//        MyStructFile()
//    }
//}
