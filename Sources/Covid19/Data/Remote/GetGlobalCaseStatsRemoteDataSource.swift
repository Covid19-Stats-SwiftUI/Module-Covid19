//
//  GetGlobalCaseStatsRemoteDataSource.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Combine
import Alamofire
import Covid19StatsCore

public struct GetGlobalCaseStatsRemoteDataSource: DataSource {
  
  public typealias Request = Any
  public typealias Response = GlobalCaseStatsResponse
  
  private let _endpoint: String
  
  public init(endpoint: String) {
    _endpoint = endpoint
  }
  
  public func execute(request: Any?) -> AnyPublisher<GlobalCaseStatsResponse, Error> {
    return Future<GlobalCaseStatsResponse, Error> { completion in
      
      guard let url = URL(string: CovidEndpoints.Gets.global.url) else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: GlobalCaseStatsResponse.self) { response in
          switch response.result {
          case .success(let result):
            completion(.success(result))
          case .failure:
            completion(.failure(CovidAPIError.invalidSerialization))
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
}
