//
//  NetworkService.swift
//  Coctails
//
//  Created by Sergey Simashov on 28.03.2022.
//

import Foundation
import Alamofire

class NetworkService{
    
    func fetchData(completion: @escaping (Result<[Drinks], Error>) -> Void) {
        let url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
        AF.request(url, method: .get)
            .response{(responseData) in
                guard let data = responseData.data else { return }
                do {
                    let drinks = try JSONDecoder().decode(DrinksResponce.self, from: data)
                    completion(.success(drinks.drinks))
                } catch {
                    completion(.failure(error))
                }
            }
    }
}

