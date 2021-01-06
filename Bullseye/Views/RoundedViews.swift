//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Rick Brown on 05/01/2021.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(Circle()
                .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
      .background(Circle()
                    .fill(Color("ButtonFilledBackgroundColor")))
  }
}

struct RoundRectTextView: View {
  var number: Int
  
  var body: some View {
    Text(String(number))
      .font(.title3)
      .kerning(-0.2)
      .bold()
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
      .foregroundColor(Color("TextColor"))
      .overlay(RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .stroke(lineWidth: Constants.General.strokeWidth)
                .foregroundColor(Color("ButtonStrokeColor"))
               
      )
    
  }
}

struct PreviewView: View {
  var body: some View {
    VStack(spacing: Constants.General.wideStrokeWidth) {
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      
      RoundedImageViewFilled(systemName: "list.dash")
      
      RoundRectTextView(number: 15)
    }
  }
}

struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
