//
//  File.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Covid19StatsCore

public struct CovidService {
  
  public static let baseUrl = "https://covid19.mathdro.id/api"
  
}

public enum CovidEndpoints {
  
  public enum Gets: Endpoint {
    case global
    case countryStats
    case country
    
    public var url: String {
      switch self {
      case .global: return "\(CovidService.baseUrl)"
      case .countryStats: return "\(CovidService.baseUrl)/"
      case .country: return "\(CovidService.baseUrl)/countries/"
      }
    }
  }
  
  public enum CaseType: String {
    case confirmed = "confirmed"
    case recovered = "recovered"
    case deaths = "deaths"
  }
  
}
