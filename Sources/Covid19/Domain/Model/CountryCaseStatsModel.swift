//
//  CountryCaseStatsModel.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation

public struct CountryCaseStatsModel: Equatable, Identifiable {
  
  public let id = UUID()
  public let provinceState: String
  public let countryRegion: String
  public let lastUpdate: Date
  public let lat: Double
  public let long: Double
  public let confirmed: Int
  public let recovered: Int
  public let deaths: Int
  public let active: Int
  public let iso2: String
  
  public var displayName: String {
    return "\(iso2.flag) \(provinceState)"
  }
  
  public init(
    provinceState: String,
    countryRegion: String,
    lastUpdate: Date,
    lat: Double,
    long: Double,
    confirmed: Int,
    recovered: Int,
    deaths: Int,
    active: Int,
    iso2: String
  ) {
    self.provinceState = provinceState
    self.countryRegion = countryRegion
    self.lastUpdate = lastUpdate
    self.lat = lat
    self.long = long
    self.confirmed = confirmed
    self.recovered = recovered
    self.deaths = deaths
    self.active = active
    self.iso2 = iso2
  }
  
}
