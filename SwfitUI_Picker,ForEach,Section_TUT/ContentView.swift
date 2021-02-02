//
//  ContentView.swift
//  SwfitUI_Picker,ForEach,Section_TUT
//
//  Created by 김선중 on 2021/02/01.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmound = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 0
    
    //퍼센트 단위를 딕셔너리로 만들어주고
    let tipPercentages = [10, 15, 20, 25 , 0]
    
    var body: some View {
        NavigationView {
            Form {
               //텍스트필드 섹션
               Section {
                    TextField("Amount", text: $checkAmound)
                        .keyboardType(.decimalPad)
                    
                    //피커 섹션
                    Picker("number of people", selection: $numberOfPeople) {
                        ForEach(0 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                //퍼센트 섹션
                Section(header: Text("How much tip do you want leave")) {
                    Picker("tip Perentage", selection: $tipPercentage) {
 
                        //0..< = 딕셔너리의 [10]부터 tipPercentage보다 작은값
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .textCase(nil)
 
                Section {
                    Text("$ \(checkAmound)")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
