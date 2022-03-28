//
//  ContentView.swift
//  Weatha
//
//  Created by Christopher Koski on 3/26/22.
//

import SwiftUI

struct TodayView: View {

  var body: some View {
    ZStack {
      BackgroundGradient()
      TopToolBar()
      CenterWeatherView()
    }
  }
}


struct TopToolBar: View {
  var body: some View {
    VStack {
      HStack {
        Image(systemName: "location.circle")
          .resizable()
          .frame(width: 30, height: 30)
          .foregroundColor(Color("TextColor"))
          .padding()
        Spacer()
        Image(systemName: "magnifyingglass")
          .resizable()
          .frame(width: 28, height: 28)
          .foregroundColor(Color("TextColor"))
          .padding()
      }
      Spacer()
    }
  }
}

struct CenterWeatherView: View {
  
  var body: some View {
    VStack {
      Text("Palm Beach")
        .kerning(1.0)
        .fontWeight(.bold)
        .foregroundColor(Color("TextColor"))
        .multilineTextAlignment(.center)
        .lineSpacing(4)
        .font(.title)
      Image(systemName: "cloud.rain")
        .resizable()
        .foregroundColor(Color("TextColor"))
        .scaledToFill()
        .frame(width: 200, height: 200)
        .padding()
      Text("76" + "°")
        .kerning(-1.0)
        .foregroundColor(Color("TextColor"))
        .fontWeight(.black)
        .font(.largeTitle)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  
  static var previews: some View {
    TodayView()
  }
}
