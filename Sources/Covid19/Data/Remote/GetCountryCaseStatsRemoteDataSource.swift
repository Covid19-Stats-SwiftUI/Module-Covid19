//
//  GetCountryCaseStatsRemoteDataSource.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Combine
import Alamofire
import Covid19StatsCore

public struct GetCountryCaseStatsRemoteDataSource: DataSource {
  
  public typealias Request = CovidEndpoints.CaseType
  public typealias Response = [CountryCaseStatsResponse]
  
  private let _endpoint: String
  
  public init(endpoint: String) {
    _endpoint = endpoint
  }
  
  public func execute(request: CovidEndpoints.CaseType?) -> AnyPublisher<[CountryCaseStatsResponse], Error> {
    return Future<[CountryCaseStatsResponse], Error> { completion in
      
      guard let url = URL(string: "\(_endpoint)\(request?.rawValue ?? "")") else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: [CountryCaseStatsResponse].self) { response in
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
