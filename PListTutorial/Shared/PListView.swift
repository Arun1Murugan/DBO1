//
//  PListView.swift
//  PListTutorial
//
//  Created by Arun_Skyraan on 19/10/22.
//

import SwiftUI

struct PListView: View {
    
    var body: some View {
        Text("Hello, World!")
    }
    
    func getDocumentsDirectory() -> URL {

        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        
    }
}

struct PListView_Previews: PreviewProvider {
    static var previews: some View {
        PListView()
    }
}
