//
//  SettingsView.swift
//  ios1024
//
//  Created by Clay Beal on 11/12/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var navi: MyNavigator
    @EnvironmentObject var viewModel: GameViewModel
    @State private var selectedGridSize: Int = 4
    @State private var selectedGoalValue: Int = 1024
    
    var body: some View {
        VStack {
            Text("Preferences")
                .font(.largeTitle)
                .padding()
            
            VStack(alignment: .leading) {
                Text("Grid Size")
                    .font(.headline)
                Picker("Grid Size", selection: $selectedGridSize) {
                    ForEach([3, 4, 5, 6, 7], id: \.self) { size in
                        Text("\(size) x \(size)").tag(size)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Goal Number")
                    .font(.headline)
                Picker("Goal Number", selection: $selectedGoalValue) {
                    ForEach([128, 256, 512, 1024, 2048, 4096], id: \.self) { goal in
                        Text("\(goal)").tag(goal)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding()
            
            HStack {
                Button("Save Pref") {
                    //TODO: Something
                    savePref()
                }
                Button("Cancel") {
                    //TODO: Something
                    navi.navBack()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
        .onAppear {
            selectedGridSize = viewModel.grid.count
            selectedGoalValue = viewModel.goalValue
        }
    }
    
    
    func savePref() {
        if selectedGridSize != viewModel.grid.count {
            viewModel.updateGridSize(gridSize: selectedGridSize)
        }
        
        if selectedGoalValue != viewModel.goalValue {
            viewModel.updateGoalValue(goal: selectedGoalValue)
        }
        navi.navBack()
    }
}

#Preview {
    SettingsView()
}
