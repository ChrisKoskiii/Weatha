//
//  ForecastCell.swift
//  Weatha
//
//  Created by Christopher Koski on 3/29/22.
//

import SwiftUI

struct ForecastCell: View {
  @ObservedObject var forecastManager: ForecastManager
  var minTemp: Int
  var maxTemp: Int
  var dayOfWeek: String
  var conditionString: String
  
  var body: some View {
    VStack {
      HStack {
        Text(dayOfWeek)
          .foregroundColor(Color("TextColor"))
        Spacer()
        VStack {
          Text("Low: \(minTemp)")
            .foregroundColor(Color("TextColor"))
          Text("High: \(maxTemp)")
            .foregroundColor(Color("TextColor"))
        }
        Spacer()
        Image(systemName: "cloud")
          .foregroundColor(Color("TextColor"))
      }
      .padding(.leading)
      .padding(.trailing)
      Divider()
    }
    .scaleEffect()
  }
}

struct ForecastCell_Previews: PreviewProvider {
  static var forecastManager = ForecastManager()
  static var previews: some View {
    ZStack {
      BackgroundGradient()
      ForecastCell(forecastManager: forecastManager, minTemp: 60, maxTemp: 80, dayOfWeek: "Monday", conditionString: "cloud")
    }
  }
}