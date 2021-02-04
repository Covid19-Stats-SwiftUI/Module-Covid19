//
//  File.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Covid19StatsCore

public struct GlobalCaseStatsResponse: Decodable {
  
  public let title: String?
  public let confirmed: ValueResponse
  public let recovered: ValueResponse
  public let deaths: ValueResponse
  
  public struct ValueResponse: Decodable {
    public let value: Int
    
    public init(value: Int) {
      self.value = value
    }
  }
  
  public init(title: String?, confirmed: ValueResponse, recovered: ValueResponse, deaths: ValueResponse) {
    self.title = title
    self.confirmed = confirmed
    self.recovered = recovered
    self.deaths = deaths
  }
}

extension GlobalCaseStatsResponse {
  
  public var confirmedText: String {
    Helper.numberFormatter.string(from: NSNumber(value: confirmed.value)) ?? "0"
  }
  
  public var recoveredText: String {
    Helper.numberFormatter.string(from: NSNumber(value: recovered.value)) ?? "0"
  }
  
  public var deathText: String {
    Helper.numberFormatter.string(from: NSNumber(value: deaths.value)) ?? "0"
  }
  
  public static var stub: GlobalCaseStatsResponse {
    .init(title: "Global 🌍", confirmed: ValueResponse(value: 100), recovered: ValueResponse(value: 100), deaths: ValueResponse(value: 100))
  }
  
}
