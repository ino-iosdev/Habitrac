//
//  AddHabitView.swift
//  Habitrac
//
//  Created by Ino Yang Popper on 5/11/25.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    var habits: Habits
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Habit Name", text: $name)
                TextField("Description", text: $description, axis: .vertical)
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let trimmedName = name.trimmingCharacters(in: .whitespaces)
                        guard trimmedName.isEmpty == false else { return }
                        
                        let item = Habit(name: trimmedName, description: description)
                        habits.items.append(item)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    AddHabitView(habits: Habits())
}
