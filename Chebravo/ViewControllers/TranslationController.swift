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
        
        // Checking input if it is only spaces
        var counter : Int = 0
        for chr in text {
            if (chr != " ") {
                break
            }
            counter += 1
        }
        
        if (counter == text.count) {
            return ""
        }
        
        // Characters allowed '+',
        let invalidCharacter : [String] = [
            "%", "%20", "£", "∞", "‰", "¢", "¡", "§", "", "$", "{", "}", "-", "_", "`", "<", ">"
        ]
        
        var parseText = text
        
        for inchr in invalidCharacter {
            // if someone types in %20 it wont break the rest of the code
            if (inchr == "%20") {
                parseText = parseText.replacingOccurrences(of: inchr, with: " ")
            } else {
                parseText = parseText.replacingOccurrences(of: inchr, with: "")
            }
        }
        print("After the parsing of invalid characters \(parseText)")
        

        
        //Replace all spaces with %20 to make the url parse the spaces
        parseText = parseText.replacingOccurrences(of: " ", with: "%20")
        
        if let URL = URL(string: "https://api-free.deepl.com/v2/translate?auth_key=\(ApiKey)&source_lang=IT&target_lang=EN&text=\(parseText)") {
            var req = URLRequest(url: URL)
            req.httpMethod = "POST"
            do {
                let (data, _) = try await URLSession.shared.data(for: req)
                
                // Translates {"translations":[{"detected_source_language":"IT","text":"Hi"}]} into the TranslationResponse obj for us to use where JSONOutput. translation[0].text = Hi
                if let JSONOutput = try? JSONDecoder().decode(TranslationResponse.self, from: data) {
                    return String(JSONOutput.translations[0].text)
                } else { print("Could not parse the JSON") }
            } catch {
                print("Error")
            }
        } else { print("Could not read the URL") }
        return "Unkown"
    }
    
    func testAPICall(text: String) async -> String {
        let TranslatedText = await translateText(text: text)
        print(TranslatedText)
        return TranslatedText
    }
}
