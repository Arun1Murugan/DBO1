//
//  SeeAllView.swift
//  PListTask_1A
//
//  Created by Arun_Skyraan on 20/10/22.
//

import SwiftUI

struct SeeAllView: View {
    
    struct PropertyListModel: Codable, Hashable {
        
        var aadhaar: String
        var name: String
        var phone: String
        var email: String
        var location: String

    }
    
   @State var pListArray: [PropertyListModel] = []
    @State var skillname: String = ""
    @State var sports: String = ""
    @State var ArrayOfArr  : [String:String] = [:]
    var ProgramingArr = ["c","c++","java"]
    var SportsArr = ["Cricket","chess","football"]
    
    var body: some View {
        
        VStack {
            List {
                ForEach(pListArray, id: \.self) { index in
                    
                    VStack {
                        
                        Text("\(index.aadhaar)")
                        Text("\(index.name)")
                        Text("\(index.phone)")
                        Text("\(index.email)")
                        Text("\(index.location)")
                        
                    }
                }
            }
        }
        .onAppear(perform: {
            
            let fileManager = FileManager.default
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
            let path = documentDirectory.appending("/profile.plist")
            do{
                
                let soundsData = try Data(contentsOf: URL(fileURLWithPath: path))
                let myPlist1 = try PropertyListDecoder().decode([PropertyListModel].self, from: soundsData)
                if myPlist1.count > 0{
                    pListArray = myPlist1
                    //                let temp = PropertyListModel(aadhaar: myPlist["aadhaar"]!, name: myPlist["name"]!, phone: myPlist["phone"]!, email: myPlist["email"]!, location: myPlist["location"]!)
//                    pListArray.append(temp)
                }
////
                
            }catch let error{
                print(error.localizedDescription)
            }
            
            
        })
        
        
    }
        
}

struct SeeAllView_Previews: PreviewProvider {
    static var previews: some View {
        SeeAllView()
    }
}
