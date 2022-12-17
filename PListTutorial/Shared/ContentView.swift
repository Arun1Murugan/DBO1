//
//  ContentView.swift
//  Shared
//
//  Created by Arun_Skyraan on 18/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var textFieldText: String = ""
    
    @State var arrPlist : [String] = []
    
    var arrFavList : NSMutableSet  = []
    
//    var myObj = PlistReader()
    
    var body: some View {
        let nsarr = self.arrFavList.allObjects as NSArray
        VStack {
            TextField("qwerty", text: $textFieldText)
            
            Button(action: {
                //                PlistReader().loadAppConfigs()
                //                myObj.loadAppConfigs()
            }, label: {
                Text("Save")
            })
            Button(action: {
//                myObj.writePropertyList(plistName: "AnotherPropertyist")
            }, label: {
                Text("write")
            })
            
            List(arrPlist, id: \.self) { url in
                
                Text("\(url)")
                
            }
            .onAppear(perform: {
                
                var arrPlist : [String] = ["1","2"]
                let url = Bundle.main.url(forResource: "Property List", withExtension: "plist")!
                let soundsData = try! Data(contentsOf: url)
                let myPlist = try! PropertyListSerialization.propertyList(from: soundsData, options: [], format: nil)
                
                        let newurl = getDocumentsDirectory().appendingPathComponent("message.plist")

                
//                self.arrPlist = myPlist as! [String]
                do {
                    let data = try PropertyListSerialization.data(fromPropertyList: myPlist, format: .binary, options: 0)
                    try data.write(to: newurl)
                } catch {
                    print(error)
                }
            })
        }
        .navigationTitle("PList")
    
    }
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

//         just send back the first one, which ought to be the only one
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//var playersDictionaryPath = NSBundle.mainBundle().pathForResource("PlayersInfo", ofType: "plist")
//
//var playersDictionary = NSMutableDictionary(contentsOfFile: playersDictionaryPath!)
//
//var playersNamesArray = playersDictionary?.objectForKey("playersNames")? as NSArray
//
//[println(playersNamesArray)][1]





//Text("Hello, World!")
//Text(pliststr)
//    .onTapGesture {
//        self.pliststr = self.getPlist(name: "Property List")
//
//    }

//func getPlist(name: String) -> String{
//        let unit_path = Bundle.main.path(forResource: name, ofType: "plist")
//        let unit_data:NSMutableDictionary = NSMutableDictionary.init(contentsOfFile: unit_path!)!
//        let unit_String = unit_data["a"]! as! String
//        unit_data.setValue("CCC", forKey: "a")
//        unit_data.write(toFile: unit_path!, atomically: true)
//        print(unit_String)
//        return unit_String
//    }



//let url = URL(fileURLWithPath: path)

//do {
//    let data = try Data(contentsOf: url)
//    var array = try PropertyListSerialization.propertyList(from: data, format: nil) as! [[String:Any]]
//    array.append(["name" : "baz", "id" : 3])
//    let writeData = try PropertyListSerialization.data(fromPropertyList: array, format: .xml, options:0)
//    try writeData.write(to: url)
//} catch {
//    print(error)
//}
