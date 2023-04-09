//
//  Home.swift
//  TaskManager
//
//  Created by Antonio Chavez Saucedo on 05/01/23.
//

import SwiftUI

struct Home: View {
    
    @State private var currentDay: Date = .init()
    @State private var tasks: [Task] = sampleTasks
    @State private var addNewTask: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            TimelineView()
                .padding(15)
        }
        .safeAreaInset(edge: .top, spacing: 0) {
            HeaderView()
        }
        .fullScreenCover(isPresented: $addNewTask) {
            AddTaskView { task in
                tasks.append(task)
            }
        }
    }
    
    // MARK: Header View
    @ViewBuilder
    func HeaderView()->some View{
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 6) {
                    Text("Today")
                        .fontCustom(30, .light)
                    Text("Welcome, iJustine")
                        .fontCustom(14, .light)
                }
                .hAlign(.leading)
                
                Button{
                    addNewTask.toggle()
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "plus")
                        Text("Add Task")
                            .fontCustom(15, .regular)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background {
                        Capsule()
                            .fill(Color("Blue").gradient)
                    }
                    .foregroundColor(.white)
                }
                
            }
            
            // Today Date in String
            Text(Date().toString("MMM YYYY"))
                .fontCustom(16, .medium)
                .hAlign(.leading)
                .padding(.top, 15)
            
            // Current Week Row
            WeekRow()
            
        }
        .padding(15)
        .background {
            VStack(spacing: 0) {
                Color.white
                Rectangle()
                    .fill(
                        .linearGradient(colors: [.white, .clear], startPoint: .top, endPoint: .bottom))
                    .frame(height: 20)
            }
            .ignoresSafeArea()
        }
    }
    
    // MARK: Week Row
    @ViewBuilder
    func WeekRow()->some View{
        HStack(spacing: 0) {
            ForEach(Calendar.current.currentWeek){weekDay in
                let status = Calendar.current.isDate(weekDay.date, inSameDayAs: currentDay)
                VStack(spacing: 6) {
                    Text(weekDay.string.prefix(3))
                        .fontCustom(12, .medium)
                    Text(weekDay.date.toString("dd"))
                        .fontCustom(16, .regular)
                }
                .foregroundColor(status ? Color("Blue") : Color("Gray"))
                .hAlign(.center)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)){
                        currentDay = weekDay.date
                    }
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, -15)
    }
    
    // MARK: Timeline View
    @ViewBuilder
    func TimelineView()->some View{
        ScrollViewReader { proxy in
            let hours = Calendar.current.hours
            let midHour = [hours.count / 2]
            VStack{
                ForEach(hours, id:\.self){hour in
                    TimelineViewRow(hour).id(hour)
                }
            }
            .onAppear{
                proxy.scrollTo(midHour)
            }
        }
    }
    
    // MARK: Timeline View Row
    @ViewBuilder
    func TimelineViewRow(_ date: Date)->some View{
        HStack(alignment: .top) {
            Text(date.toString("h a"))
                .fontCustom(14, .regular)
                .frame(width: 45, alignment: .leading)
            
            // Filtering tasks
            let calendar = Calendar.current
            let filteredTasks = tasks.filter {
                if let hour = calendar.dateComponents([.hour], from: date).hour,
                    let taskHour = calendar.dateComponents([.hour], from: $0.dateAdded).hour,
                    hour == taskHour && calendar.isDate($0.dateAdded, inSameDayAs: currentDay){
                    return true
                }
                return false
            }
            
            if filteredTasks.isEmpty{
                Rectangle()
                    .stroke(
                        Color("Gray").opacity(0.5), style: StrokeStyle(lineWidth: 0.5, lineCap: .butt, lineJoin: .bevel, dash: [5], dashPhase: 5))
                    .frame(height: 0.5)
                    .offset(y: 10)
            }else{
                // Task View
                VStack(spacing: 10) {
                    ForEach(filteredTasks){task in
                        TaskRow(task)
                    }
                }
            }
            
        }
        .hAlign(.leading)
        .padding(.vertical, 15)
    }
    
    @ViewBuilder
    func TaskRow(_ task: Task)->some View{
        VStack(alignment: .leading, spacing: 8) {
            Text(task.taskName.uppercased())
                .fontCustom(16, .regular)
                .foregroundColor(task.taskCategory.color)
            if task.taskDescription.isEmpty == false{
                Text(task.taskDescription)
                    .fontCustom(14, .light)
                    .foregroundColor(task.taskCategory.color.opacity(0.8))
            }
        }
        .hAlign(.leading)
        .padding(12)
        .background{
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(task.taskCategory.color)
                    .frame(width: 4)
                Rectangle()
                    .fill(task.taskCategory.color.opacity(0.25))
            }
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
