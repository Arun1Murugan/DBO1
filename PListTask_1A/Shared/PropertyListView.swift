//
//  PropertyListView.swift
//  PlistTask1
//
//  Created by Arun_Skyraan on 19/10/22.
//

import SwiftUI

struct PropertyListView: View {
    
//        struct PropertyListModel: Codable {
//
//            var aadhaar: String
//            var name: String
//            var phone: String
//            var email: String
//            var location: String
//
//            enum propertyKeys: String, CodingKey {
//                case aadhaar = "aadhaar"
//                case name = "name"
//                case phone = "phone"
//                case email = "email"
//                case location = "location"
//            }
//        }
    
    @State var aadhaarNumber: String = ""
    @State var name: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var location: String = ""
    
    @State var setOfDetails: [[String: String]] = []
//  @State var plistModelArray : [PropertyListModel] = []
    
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                TextField("aadhaar number", text: $aadhaarNumber)
                    .padding()
                TextField("name", text: $name)
                    .padding()
                TextField("phone number", text: $phone)
                    .padding()
                TextField("email address", text: $email)
                    .padding()
                TextField("location", text: $location)
                    .padding()
                
                Spacer()
                
            }
            .foregroundColor(.white)
            .background(Color.green)
            .navigationTitle("Property List")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    NavigationLink(destination: {
                        SeeAllView()
                    }, label: {
                        Text("see all")
                            .bold()
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(10)
                    })
                })
                ToolbarItem(placement: .bottomBar, content: {
                    
                    Button(action: {
                        
                        let fileManager = FileManager.default
                        
                        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
                        let path = documentDirectory.appending("/profile.plist")
                        
                        if(!fileManager.fileExists(atPath: path)){
                            print(path)
                            
                            let data : [[String: String]] = [[
                                "aadhaar": "\(aadhaarNumber)",
                                "name": "\(name)",
                                "phone": "\(phone)",
                                "email": "\(email)",
                                "location": "\(location)",
                            ]]
                            
                            let someData = NSArray(array: data)
                            let isWritten = someData.write(toFile: path, atomically: true)
                            print("is the file created: \(isWritten)")
                            
                        } else {
                            
                            
                            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
                            let path = documentDirectory.appending("/profile.plist")
                            
                            //                            var dict: [String: String] = [:]
                            var dict = [[String: String]]()
                            
                            let nsDict = dict as! NSArray
                            
                            do{
                                
                                let soundsData = try Data(contentsOf: URL(fileURLWithPath: path))
                                let myPlist = try PropertyListDecoder().decode([[String:String]].self, from: soundsData)
                                
                                let data : [[String: String]] = [[
                                    "aadhaar": "\(aadhaarNumber)",
                                    "name": "\(name)",
                                    "phone": "\(phone)",
                                    "email": "\(email)",
                                    "location": "\(location)",
                                ]]
                                var someData = NSMutableArray(array: myPlist)
                                someData.addObjects(from: data)
                                let isWritten = someData.write(toFile: path, atomically: true)
                                print("is the file created: \(isWritten)")
                                
                                for x in myPlist{
                                    dict.append(x)
                                }
                                print(dict)
                                print(path)
                                
                            } catch {
                                print("Err occured")
                            }
                        }
                        
                    }, label: {
                        Text("save")
                            .bold()
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(10)
                    })
                })
            })
        }
    }
}

struct PropertyListView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyListView()
    }
}

//extension Dictionary where Key: Encodable, Value: Encodable {
//    func writeToURL(_ url: URL) throws {
//        // archive data
//        let data = try PropertyListEncoder().encode(self)
//        try data.write(to: url)
//    }
//}
