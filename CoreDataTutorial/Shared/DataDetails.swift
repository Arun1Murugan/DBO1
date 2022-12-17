//
//  DataDetails.swift
//  CoreDataTutorial
//
//  Created by Arun_Skyraan on 08/09/22.
//

import SwiftUI

struct DataDetails: View {
    @State var EntityArr : [Employee] = []
    var CoreDataManagerObj = CoreDataManager()
    var body: some View {
        ZStack{
            if EntityArr.count > 0{
            List{
                ForEach(EntityArr,id:\.self){ data in
                    Text("name : \(data.name!) ID :\(data.id)  email :  address ")
                    
                }
                .frame(width: 300)
//                .background(Color.primary)
            }
            }else{
                Text("Loading")
                    .onAppear(perform: {
                        DispatchQueue.main.async {
                            EntityArr =  CoreDataManagerObj.getAllDetails()
                        }
                      
                    })
            }
        }
    }
}

struct DataDetails_Previews: PreviewProvider {
    static var previews: some View {
        DataDetails()
    }
}


//
