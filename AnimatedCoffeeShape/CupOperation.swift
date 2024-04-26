//// Logic | Operations for cups increasing & decreasing
//
//
//import SwiftUI
//import AVFoundation
//
//
//extension ContentView {
//    
//
//    
//    public  mutating func cupButton(for cupSize: CupSize, count: Int) -> some View {
//           VStack {
//               Button(action: {
//                   self.selectedCup = cupSize
//               }) {
//                   VStack {
//                       Image(getImageName(cupSize.rawValue))
//                           .resizable()
//                           .aspectRatio(contentMode: .fit)
//                           .frame(width: 30, height: 30)
//                       Text(cupSize.rawValue)
//                           .foregroundColor(.black)
//                   
//                   }
//               }
//
//               
//           
//                        HStack {
//                            Button(action: {
//                                if count > 0 {
//                                    self.decreaseCupsCount(cupSize: cupSize)
//                                }
//                            }) {
//                                Text("-")
//                                    .font(.title)
//                                    .foregroundColor(.gray)
//                                
//                            }
//                            
//                            Spacer()
//                            
//                            Text("\(count)")
//                                .foregroundColor(.black)
//                                .font(.headline)
//                  
//                            
//                            Spacer()
//                            
//                            Button(action: {
//                                self.increaseCupsCount(cupSize: cupSize)
//                                
//                            }) {
//                                Text("+")
//                                    .font(.title)
//                                    .foregroundColor(.gray)
//                            }
//                        }
//                        
//                      
//                        
//              
//           }
//           .padding(.horizontal)
//       }
//
//
//    func getImageName(_ size: String) -> String {
//        switch size {
//            case "صغير":
//                return "cup-14"
//            case "وسط":
//                return "cup-10"
//            case "كبير":
//                return "cup-13"
//            default:
//                return "Cup"
//        }
//    }
//
//    
//    public mutating func increaseCupsCount(cupSize: CupSize) {
//        switch cupSize {
//        case .small:
//            smallCupsCount += 1
//  
//
//            amountDrinkingCups += 270
//         
//            SoundManager.shared.playSound(soundName: "bubble", volume: 0.2, extensionS: "mp3")
//        case .medium:
//            mediumCupsCount += 1
//   
//       
//            SoundManager.shared.playSound(soundName: "bubble", volume: 0.2, extensionS: "mp3")
//        case .large:
//            largeCupsCount += 1
//        
//            amountDrinkingCups += 450
//     
//            SoundManager.shared.playSound(soundName: "bubble", volume: 0.2, extensionS: "mp3")
//        }
//
//        UserDefaults.standard.synchronize()
//        updatePercentage()
//    }
//
//    private  mutating func decreaseCupsCount(cupSize: CupSize) {
//        switch cupSize {
//        case .small:
//            if smallCupsCount > 0 {
//                smallCupsCount -= 1
//                amountDrinkingCups -= 270
//
//                SoundManager.shared.playSound(soundName: "delete", volume: 0.2, extensionS: "wav")
//            }
//        case .medium:
//            if mediumCupsCount > 0 {
//                mediumCupsCount -= 1
//                amountDrinkingCups -= 370
//  
//                SoundManager.shared.playSound(soundName: "delete", volume: 0.2 , extensionS: "wav")
//            }
//        case .large:
//            if largeCupsCount > 0 {
//                largeCupsCount -= 1
//                amountDrinkingCups -= 450
//      
//                SoundManager.shared.playSound(soundName: "delete", volume: 0.2 , extensionS: "wav")
//            }
//        }
//
//        UserDefaults.standard.synchronize()  // Synchronize UserDefaults if needed
//        updatePercentage()
//    }
//
//    
//    public  mutating func updatePercentage() {
//        percent = max(0, amountDrinkingCups * 100 / 950)
//  
//   
//    }
//    
//    
//
//
//
//    
//}
//
