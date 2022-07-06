//
//  TranslationController.swift
//  Chebravo
//
//  Created by Phillip Lundin on 02/07/2022.
//

import Foundation

/// <summary> Controller that helps translating words across the application </summary>
class TranslationController {
    static let ApiKey = APIKey().DeepLTranslatorAPIKey
    static var translatedWord : String = ""

    
    
    /// <summary> Translates a text into english
    /// <param name="text"> Italian word that will be translated into english </param>
    /// <PRECONDITION> The text should be italian </PRECONDITION>
    @MainActor
    static func translateText(text : String) async -> String {
        guard let URL = URL(string: "https://api-free.deepl.com/v2/translate?auth_key=\(TranslationController.ApiKey)&source_lang=IT&target_lang=EN&text=\(text)") else {
            fatalError("Invalid URL")
        }
        
        var req = URLRequest(url: URL)
        req.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.data(for: req)
            if let responseData = String(data: data, encoding: .utf8) {
                
                // Finds the the word inside the string with a suffix of "text":
                // e.g. {"translations":[{"detected_source_language":"EN","text":"Hallo, Welt"}]} gets Hallo, Welt
                let regPattern : String = "(?<=\"text\":.).[^\"]*"
                if let regResult = responseData.range(of: regPattern, options: .regularExpression) {
                    return String(responseData[regResult])

                }
            }
        } catch {
            fatalError("Could not make URLSession")
        }
        return "Unkown"
    }
}





// Will not convert the data into the TranslationResponse
//                if let re = try? JSONDecoder().decode([TranslationResponse].self, from: data) {
//                    print("Found some data converting and saving")
//                    DispatchQueue.main.async {
//                        print("WHAAAT\(re[0].translations)")
//                    }
//
//                }


//            DispatchQueue.main.async {
//                if let data = data {
//                    if let responseData = String(data: data, encoding: .utf8) {
//                        print("ResponseData \(responseData)")
//
//                        let regPattern : String = "(?<=\"text\":.).[^\"]*"
//                            if let regResult = responseData.range(of: regPattern, options: .regularExpression) {
//                                print("Translation : \(responseData[regResult])")
//                                TranslationController.translatedWord = String(responseData[regResult])
//                            }
//                    }
//                }
//            }
