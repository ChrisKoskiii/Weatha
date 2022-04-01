//
//  DailyView.swift
//  Weatha
//
//  Created by Christopher Koski on 3/26/22.
//

import SwiftUI

struct DailyView: View {
  @ObservedObject var forecastManager: ForecastManager
  
  var body: some View {
    ZStack {
      BackgroundGradient()
      CellsView(forecastManager: forecastManager)
    }
  }
}

//view is loading up before data is in the array?
struct CellsView: View {
  @ObservedObject var forecastManager: ForecastManager
  var body: some View {
    VStack {
      ForEach(1..<forecastManager.listArray.count) { i in
        ForecastCell(forecastManager: forecastManager, minTemp: Int(forecastManager.listArray[i].temp.min), maxTemp: Int(forecastManager.listArray[i].temp.max), dayOfWeek: DateConversion().convertDate(from: forecastManager.listArray[i].dt), conditionString: "cloud")
      }
    }
  }
}


struct DailyView_Previews: PreviewProvider {
  static var forecastManager = ForecastManager()
  static var previews: some View {
    DailyView(forecastManager: forecastManager)
  }
}
