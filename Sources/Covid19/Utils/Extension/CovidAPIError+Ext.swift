//
//  CovidAPIError+Ext.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation

public enum CovidAPIError: Error {
  case invalidURL
  case invalidSerialization
  case badHTTPResponse
  case error(NSError)
  case noData
}
