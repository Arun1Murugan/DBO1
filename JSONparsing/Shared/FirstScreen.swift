//
//  FirstScreen.swift
//  JSONparsing
//
//  Created by Arun_Skyraan on 15/09/22.
//

import SwiftUI
import Foundation

struct myDatas : Decodable ,Hashable{
    
    var Category_Name: String
    var Category_Id: Int?
    var  Book: String
    var  Book_Id: Int?
    var Chapter: Int?
    var Verse: String
}




struct FirstScreen: View {
    
    @ObservedObject var myObject = ReadData()
    
    var body: some View {
        VStack {
            List {
                ForEach(myObject.myData,id: \.self){
                    item in
                    if let num = item.Book_Id{
                        Text("Category name : \(item.Category_Name)  Book id : \(num)")
                    }else{
                        Text("Error")
                            .background(Color.red)
                        
                    }
                }
                
            }
        }
    }
}



class ReadData: ObservableObject  {
    @Published var myData = [myDatas]()
    
    
//    init(){
//        guard let url = Bundle.main.url(forResource: "myData", withExtension: "json")
//        else {
//            print("Json file not found")
//            return
//        }
//
//        let data = try? Data(contentsOf: url)
//        let users = try? JSONDecoder().decode([myDatas].self, from: data!)
//        self.myData = users!
//    }
    
    //    func loadData()  {
    //        guard let url = Bundle.main.url(forResource: "myData", withExtension: "json")
    //            else {
    //                print("Json file not found")
    //                return
    //            }
    //
    //        let data = try? Data(contentsOf: url)
    //        let users = try? JSONDecoder().decode([myDatas].self, from: data!)
    //        self.myData = users!
    //
    //    }
    
}





struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
