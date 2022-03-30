//
//  MainView.swift
//  Weatha
//
//  Created by Christopher Koski on 3/26/22.
//

import SwiftUI

struct MainView: View {
  
  var body: some View {
    TabView {
      TodayView(weatherManager: CurrentWeatherManager())
        .tabItem {
          Label("Today", systemImage: "sun.max")
        }
      DailyView()
        .tabItem {
          Label("Daily", systemImage: "calendar")
        }
      SettingsView()
        .tabItem {
          Label("Settings", systemImage: "gear")
        }
    }
    .accentColor(Color("TextColor"))
  }
}

struct MainView_Previews: PreviewProvider {
  static var weatherManager = CurrentWeatherManager()
  
  static var previews: some View {
    MainView().preferredColorScheme(.dark)
  }
}
