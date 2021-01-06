//
//  PointsView.swift
//  Bullseye
//
//  Created by Rick Brown on 06/01/2021.
//

import SwiftUI

struct PointsView: View {
  var body: some View {
    VStack(spacing: 10) {
      InstructionText(text: "The sliders value is")
      BigNumberText(number: 50)
      BodyText(text: "You scored 200 points\n🎉🎉🎉")
      Button(action: {}) {
        ButtonText(text: "Start new round")
      }
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(21.0)
    .shadow(radius: 10, x: 5, y: 5)
  }
}

struct PointsView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      PointsView()
      
      PointsView()
        .previewLayout(.fixed(width: 568, height: 320))
        .padding()
      
      PointsView()
        .preferredColorScheme(.dark)
      
      PointsView()
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 568, height: 320))
        .padding()

    }
  }
}
