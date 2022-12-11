//
//  GuestDetailsView.swift
//  OpenTable-Test
//
//  Created by Jose Gutierrez on 09/12/22.
//

import SwiftUI

struct GuestDetailsView: View {
    @FocusState private var nameFocused: Bool
    @Binding var showingSheet: Bool
    @State private var nameText: String = ""
    @State private var phone: String = ""
    @State private var visitNotes: String = ""
    @State private var shouldShowNameError = false
    let selectedTime: Date
    let partySize: Int
    var onReservationComplete: (Reservation) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Name")
            TextField("Name", text: $nameText)
                .frame(height: 50)
                .modifier(RoundedTextFieldStyle())
                .focused($nameFocused)
                .autocorrectionDisabled()
                .onChange(of: nameText, perform: { newValue in
                    shouldShowNameError = newValue.isEmpty
                })
            
            if shouldShowNameError {
                Text("Name should be at least 1 character long")
                    .foregroundColor(.red)
                    .padding([.vertical], 3)
            }
            
            Text("Phone")
            TextField("Phone", text: $phone)
                .frame(height: 50)
                .modifier(RoundedTextFieldStyle())
            
            Text("Visit notes")
            TextField("Visit notes", text: $visitNotes, axis: .vertical)
                .frame(minHeight: 80)
                .modifier(RoundedTextFieldStyle())
            
            Spacer()
        }
        .navigationTitle("Guest Details")
        .toolbar {
            Button("Save") {
                validateEntries()
            }
        }
        .padding()
    }
}

private extension GuestDetailsView {
    func validateEntries() {
        if areValidEntries() {
            showingSheet = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                onReservationComplete(Reservation(
                    time: selectedTime,
                    name: nameText,
                    partySize: partySize,
                    phoneNumber: phone,
                    visitNotes: visitNotes))
            }
        }
    }
    
    func areValidEntries() -> Bool {
        if nameText.isEmpty {
            nameFocused = true
            shouldShowNameError = true
            return false
        }
        return true
    }
}

struct RoundedTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(PlainTextFieldStyle())
            .padding([.horizontal], 6)
            .cornerRadius(16)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
    }
}

struct GuestDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GuestDetailsView(
            showingSheet: .constant(true),
            selectedTime: Date(),
            partySize: 1) { _ in }
    }
}
