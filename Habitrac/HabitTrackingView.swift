//
//  HabitTrackingView.swift
//  Habitrac
//
//  Created by Ino Yang Popper on 5/11/25.
//

import SwiftUI

struct HabitTrackingView: View {
    @Binding var habit: Habit
    
    var body: some View {
            List {
                Section {
                    TextField("Habit Name", text: $habit.name)
                    TextEditor(text: $habit.description)
                } header: {
                    Text("Edit Habit")
                }

                Section {
                    Button("Mark as Completed") {
                        habit.completionCount += 1
                    }
                    Text("Completed: \(habit.completionCount) times")
                } header: {
                    Text("Tracking")
                }
            }
            .navigationTitle($habit.name)
            .navigationBarTitleDisplayMode(.inline)
        }
}


#Preview {
    HabitTrackingView(habit: .constant(.example))
}
