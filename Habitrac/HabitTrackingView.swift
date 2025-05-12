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
                    Text("Completed: \(habit.completionCount) \(habit.completionCount < 2 ? "time" : "times")")
                } header: {
                    Text("Tracking")
                }
            }
        }
}


#Preview {
    HabitTrackingView(habit: .constant(.example))
}
