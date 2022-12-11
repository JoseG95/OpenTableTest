//
//  ContentView.swift
//  OpenTable-Test
//
//  Created by Jose Gutierrez on 09/12/22.
//

import SwiftUI

struct TimesView: View {
    let availableTimes = TimesProvider.getTimesStrings()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(0..<availableTimes.count, id: \.self) { index in
                        TimeCellView(time: availableTimes[index])
                            .onTapGesture {
                                showingSheet.toggle()
                            }
                            .sheet(isPresented: $showingSheet) {
                                SheetView()
                            }
                    }
                }
            }
            .navigationTitle("Select a time")
        }
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimesView()
    }
}
