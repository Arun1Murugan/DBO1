//
//  File.swift
//  PListTutorial
//
//  Created by Arun_Skyraan on 18/10/22.
//

import Foundation
import  SwiftUI

//struct DataManager {
//
//    static var shared = DataManager()
//
//    var dataFilePath: String? {
//        return Bundle.main.path(forResource: "myPList", ofType: "plist")
//    }
//
//    var dict: NSMutableDictionary? {
//        guard let filePath = self.dataFilePath else { return nil }
//        return NSMutableDictionary(contentsOfFile: filePath)
//    }
//
//    let fileManager = FileManager.default
//
//    fileprivate init() {
//
//        guard let path = dataFilePath else { return }
//        guard fileManager.fileExists(atPath: path) else {
//            fileManager.createFile(atPath: path, contents: nil, attributes: nil) // create the file
//            print("created Data.plist file successfully")
//            return
//        }
//    }
//
//    func save(_ value: Any, for key: String) -> Bool {
//        guard let dict = dict else { return false }
//
//        dict.setObject(value, forKey: key as NSCopying)
//        dict.write(toFile: dataFilePath!, atomically: true)
//
//        // confirm
//        let resultDict = NSMutableDictionary(contentsOfFile: dataFilePath!)
//        print("saving, dict: \(String(describing: resultDict))") // I can see this is working
//
//        return true
//    }
//
//    func delete(key: String) -> Bool {
//        guard let dict = dict else { return false }
//        dict.removeObject(forKey: key)
//        return true
//    }
//
//    func retrieve(for key: String) -> Any? {
//        guard let dict = dict else { return false }
//
//        return dict.object(forKey: key)
//    }
//}


//func savePropertyList(_ plist: [String:Any])
//    {
//        let path = Bundle.main.path(forResource: "PL", ofType: "plist")!
//        let url = URL(fileURLWithPath: path)
//        do{
//            let data = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
//            try data.write(to: url)
//        }
//        catch{
//            print(error.localizedDescription)
//        }
//    }
//
//    func loadPropertyList() -> [String:Any]?
//    {
//        let path = Bundle.main.path(forResource: "PL", ofType: "plist")!
//        let url = URL(fileURLWithPath: path)
//        do{
//            let data = try Data(contentsOf: url)
//            guard let dict = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String:Any] else{
//                return [:]
//            }
//            return dict
//        }
//        catch{
//            print(error.localizedDescription)
//        }
//        return [:]
//    }


//class PlistReader {
//    
//    //    static var shared = PlistReader()
//    
//    var appSettings: NSDictionary!
//    
//    func getPropertyList(name: String) -> NSDictionary {
//        
//        // First let's get the path to our property list
//        guard let path = Bundle.main.path(forResource: name, ofType: "plist"),
//              let xml = FileManager.default.contents(atPath: path) else {
//            // If the property list doesn't exist, we'll throw an error for now.
//            fatalError("Unable to load the requested property list")
//        }
//        // With data read into the xml variable we can now decode into a dictionary object.
//        let propertyDictionary = try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil) as? NSDictionary
//        
//        print(propertyDictionary!)
//        return propertyDictionary!
//        
//    }
//    func loadAppConfigs() {
//        appSettings = getPropertyList(name: "Property List")
//    }
//    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        loadAppConfigs()
//        return true
//    }
//    
//    func writePropertyList(plistName: String) {
//        
//        let fileExtension = ".plist"
//        let path = Bundle.main.resourcePath
//        let filePath = URL(fileURLWithPath: path! + "/" + plistName + fileExtension)
//        
//        do {
//            let data = try PropertyListSerialization.data(fromPropertyList: appSettings ?? "", format: .xml, options: 0)
//            try data.write(to: filePath)
//        } catch {
//            fatalError(error as! String)
//        }
//    }
//    
//}




