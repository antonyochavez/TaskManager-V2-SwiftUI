//
//  Task.swift
//  TaskManager
//
//  Created by Antonio Chavez Saucedo on 05/01/23.
//

import SwiftUI

struct Task: Identifiable{
    var id = UUID.init()
    var dateAdded: Date
    var taskName: String
    var taskDescription: String
    var taskCategory: Category
}

var sampleTasks: [Task] = [
    .init(dateAdded: Date(timeIntervalSince1970: 1672948570), taskName: "Edit YT View", taskDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", taskCategory: .general),
    .init(dateAdded: Date(timeIntervalSince1970: 1672955759), taskName: "Matched Geometry", taskDescription: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", taskCategory: .bug),
    .init(dateAdded: Date(timeIntervalSince1970: 1672962959), taskName: "Loreal Ipsum", taskDescription: "", taskCategory: .idea),
    .init(dateAdded: Date(timeIntervalSince1970: 1672970159), taskName: "Fix Shadow", taskDescription: "", taskCategory: .challenge),
    .init(dateAdded: Date(timeIntervalSince1970: 1672933067), taskName: "Twitter", taskDescription: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout", taskCategory: .coding),
    .init(dateAdded: Date(timeIntervalSince1970: 1672933067), taskName: "Twitter 2", taskDescription: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout", taskCategory: .idea)
]
