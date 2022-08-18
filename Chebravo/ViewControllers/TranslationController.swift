//
//  TranslationController.swift
//  Chebravo
//
//  Created by Phillip Lundin on 02/07/2022.
//

import Foundation

/// <summary> Controller that helps translating words across the application </summary>
class TranslationController {
    let ApiKey = APIKey().DeepLTranslatorAPIKey
    
    /// <summary> Translates a text into english </summary>
    /// <param name="text"> Italian word that will be translated into english </param>
    /// <PRECONDITION> The text should be italian </PRECONDITION>
    @MainActor
    func translateText(text : String) async -> String {
        //Replace all spaces with %20 to make the url parse the spaces
        let parseText = text.replacingOccurrences(of: " ", with: "%20")
        
        if let URL = URL(string: "https://api-free.deepl.com/v2/translate?auth_key=\(ApiKey)&source_lang=IT&target_lang=EN&text=\(parseText)") {
            var req = URLRequest(url: URL)
            req.httpMethod = "POST"
            do {
                let (data, _) = try await URLSession.shared.data(for: req)
                
                // Translates {"translations":[{"detected_source_language":"IT","text":"Hi"}]} into the TrnslationResponse obj for us to use
                if let JSONOutput = try? JSONDecoder().decode(TranslationResponse.self, from: data) {
                    return String(JSONOutput.translations[0].text)
                }
            } catch {
                print("Error")
            }
        }
        return "Unkown"
    }
    
    func testAPICall(text: String) async -> String {
        let TranslatedText = await translateText(text: text)
        print(TranslatedText)
        return TranslatedText
    }
}
