//
//  GlobalCaseStatsModel.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Covid19StatsCore

public struct GlobalCaseStatsModel: Equatable {
  
  public let confirmed: ValueModel
  public let recovered: ValueModel
  public let deaths: ValueModel
  
  public init(confirmed: ValueModel, recovered: ValueModel, deaths: ValueModel) {
    self.confirmed = confirmed
    self.recovered = recovered
    self.deaths = deaths
  }
  
  public var confirmedText: String {
    Helper.numberFormatter.string(from: NSNumber(value: confirmed.value)) ?? "0"
  }
  
  public var recoveredText: String {
    Helper.numberFormatter.string(from: NSNumber(value: recovered.value)) ?? "0"
  }
  
  public var deathText: String {
    Helper.numberFormatter.string(from: NSNumber(value: deaths.value)) ?? "0"
  }
  
  public struct ValueModel: Equatable {
    public let value: Int
    
    public init(value: Int) {
      self.value = value
    }
  }
  
}

extension GlobalCaseStatsModel {
  
  public static var stub: GlobalCaseStatsModel {
    .init(confirmed: ValueModel(value: 100), recovered: ValueModel(value: 100), deaths: ValueModel(value: 100))
  }
  
}
