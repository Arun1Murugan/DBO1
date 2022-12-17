////
////  ObservableAndStateTutorial.swift
////  JSONparsing
////
////  Created by Arun_Skyraan on 16/09/22.
////
//
//import SwiftUI
//
//struct fruits:Hashable {
////    var id: Int = UUID
//
//    var name : String
//    var count : Int
//}
//
//struct ObservableAndStateTutorial: View {
//
//    @State private var fruitArray : [fruits] = []
////    init(){
////        getFruits()
////    }
//    var body: some View {
//
//        List{
////            ForEach(fruitArray){ fr in
//
//                HStack {
//                    Text("\(count)")
//                    Text(name)
//                }
//
//            }
//        }
//    }
//
//
//    func getFruits(){
//        let f1 = fruits(name: "Apple", count: 3)
//        let f2 = fruits(name: "Orange", count: 3)
//        let f3 = fruits(name: "Peach", count: 3)
//
//        fruitArray.append(f1)
//        fruitArray.append(f2)
//        fruitArray.append(f3)
//
//    }
//
//    func deleteFruits(f : IndexSet){
//        fruitArray.remove(atOffsets: f)
//    }
//}
//
//
//
//
//struct ObservableAndStateTutorial_Previews: PreviewProvider {
//    static var previews: some View {
//        ObservableAndStateTutorial()
//    }
//}
