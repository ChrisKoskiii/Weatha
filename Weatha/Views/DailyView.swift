//
//  DailyView.swift
//  Weatha
//
//  Created by Christopher Koski on 3/26/22.
//

import SwiftUI

struct DailyView: View {
  var body: some View {
    ZStack {
      BackgroundGradient()
      CellsView()
    }
  }
}

struct CellsView: View {
  var body: some View {
    VStack {
      ForEach(1..<7) {_ in
        DayCell()
      }
    }
  }
}
struct DayCell: View {
  var body: some View {
    VStack {
      HStack {
        Text("Monday")
          .foregroundColor(Color("TextColor"))
        Spacer()
        VStack {
          Text("High: 98")
            .foregroundColor(Color("TextColor"))
          Text("Low: 87")
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

struct DailyView_Previews: PreviewProvider {
  static var previews: some View {
    DailyView()
  }
}
