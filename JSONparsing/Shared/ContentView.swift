//
//  ContentView.swift
//  Shared
//
//  Created by Arun_Skyraan on 14/09/22.
//

import SwiftUI

class fetchdata : ObservableObject{
    @Published var obj = [MyStruct]()
    init(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url)
        {(data,_,_) in
            do {
               
                if let tododata = data{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                    print("json",json)
                    let dedcodeddata = try JSONDecoder().decode([MyStruct].self, from: tododata)
                    DispatchQueue.main.async {
                        self.obj = dedcodeddata
                        print("dedcodeddata ",dedcodeddata)
                    }
                } else {
                    print("NO data")
                }
                
            }catch  {  print("error")}
        }.resume()
    }
}

struct ContentView: View {
    @ObservedObject var fetchdataObj = fetchdata()
    var body: some View {
        List {
            Text("HW")
            ForEach(fetchdataObj.obj) { index in
                VStack {
                    
                    Text ("\(index.name)\n \(index.phone) \n \(index.address.city)")
                }
            }
        }
//            .onAppear {
//
//                    let url = URL(string: "https://generateappicon.com/kids_education/api/app/category_list_from_app_id")!
//                    URLSession.shared.dataTask(with: url) {(data, response, error) in
//                        do {
//                            if let todoData = data {
//                                let decodedData = try JSONDecoder().decode([Model].self, from: todoData)
//                                DispatchQueue.main.async {
//                                    print(decodedData)
//                                }
//                            } else {
//                                print("No data")
//                            }
//                        } catch {
//                            print("Error")
//                        }
//                    }.resume()
//            }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
