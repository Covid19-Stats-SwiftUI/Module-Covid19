//
//  GetCountriesRemoteDataSource.swift
//  
//
//  Created by Ari Supriatna on 03/02/21.
//

import Foundation
import Combine
import Alamofire
import Covid19StatsCore

public struct GetCountriesRemoteDataSource: DataSource {
  
  public typealias Request = Any
  public typealias Response = [CountryResponse]
  
  private let _endpoint: String
  
  public init(endpoint: String) {
    _endpoint = endpoint
  }
  
  public func execute(request: Any?) -> AnyPublisher<[CountryResponse], Error> {
    return Future<[CountryResponse], Error> { completion in
      
      guard let url = URL(string: CovidEndpoints.Gets.country.url) else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: CountriesResponse.self) { response in
          switch response.result {
          case .success(let result):
            completion(.success(result.countries))
          case .failure:
            completion(.failure(CovidAPIError.invalidSerialization))
          }
        }
      
    }.eraseToAnyPublisher()
  }
}
