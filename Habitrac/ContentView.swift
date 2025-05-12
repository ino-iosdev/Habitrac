//
//  ContentView.swift
//  Habitrac
//
//  Created by Ino Yang Popper on 5/11/25.
//

import SwiftUI

struct Habit: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var completionCount = 0
    
    static let example = Habit(name: "Swimming", description: "workout")
}

struct ContentView: View {
    @State private var habits = Habits()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($habits.items) { habit in
                    NavigationLink {
                        HabitTrackingView(habit: habit)
                    } label: {
                        HStack {
                            Text(habit.name.wrappedValue)
                                .font(.headline)
                            
                            Spacer()
                            
                            Text(String(habit.completionCount.wrappedValue))
                                .font(.caption.weight(.black))
                                .padding(5)
                                .frame(minWidth: 50)
                                .background(color(for: habit.wrappedValue))
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
                        }
                        
                    }
                    
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habitrac")
            .toolbar {
                NavigationLink {
                    AddHabitView(habits: habits)
                } label: {
                    Label("Add Habit", systemImage: "plus")
                }
            }
        }
    }
    
    func color(for habit: Habit) -> Color {
        if habit.completionCount < 3 {
            .red
        } else if habit.completionCount < 10 {
            .orange
        } else if habit.completionCount < 20 {
            .green
        } else if habit.completionCount < 50 {
            .blue
        } else {
            .indigo
        }
    }
    
        func removeItems(at offsets: IndexSet) {
            habits.items.remove(atOffsets: offsets)
        }
    }
    
    #Preview {
        ContentView()
    }
