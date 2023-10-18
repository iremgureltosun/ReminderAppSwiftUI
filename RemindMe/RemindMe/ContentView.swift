//
//  ContentView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 22.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ListLectureView()
                .tabItem {
                    Label("Lectures", systemImage: "calendar")
                }

            ListStudentView()
                .tabItem {
                    Label("Students", systemImage: "person")
                }

            ListSchoolView()
                .tabItem {
                    Label("Schools", systemImage: "graduationcap")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
