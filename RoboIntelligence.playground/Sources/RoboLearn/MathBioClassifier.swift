import Foundation

public class MathBioClassifier {
    private var wordOccurCount:[String: [String:Int]] = [:]
    private var typeOccurCount:[String: Int] = [:]
    
    private var totalTeachingCount = 0
    private var totalWordCount = 0
    
    public init(teachFromScratch:Bool=false) {
        if !teachFromScratch {
            self.wordOccurCount = MathBioDataset.wordOccurCount
            self.typeOccurCount = MathBioDataset.typeOccurCount
            
            self.totalTeachingCount = MathBioDataset.totalTeachingCount
            self.totalWordCount = MathBioDataset.totalWordCount
        }
    }
    
    // MARK:- Teach/train classifier
    public func teach(_ text:String, type:String) {
        let tokens = tokenize(text)
        
        for word in tokens {
            if let _ = wordOccurCount[word]{}else{
                totalWordCount += 1
                wordOccurCount.updateValue([:], forKey: word)
            }
            
            if let _ = wordOccurCount[word]?[type] {
                wordOccurCount[word]![type]! += 1
            }else{
                wordOccurCount[word]?.updateValue(1, forKey: type)
            }
        }
        
        if let _ = typeOccurCount[type] {
            typeOccurCount[type]! += 1
        }else{
            typeOccurCount.updateValue(1, forKey: type)
        }
        
        totalTeachingCount += 1
    }
    
    public func printData() {
        print("word occur count: \(wordOccurCount)\ntype occur count: \(typeOccurCount)\ntotal train count: \(totalTeachingCount)\ntotal word count: \(totalWordCount)")
    }
    
    public func predict(_ text:String) -> String? {
        let tokens = tokenize(text)
        var maxType:String?
        var maxTypeScore = -Double.infinity
        
        for (type, _) in typeOccurCount {
            let typeProbablity = P(type)
            let typeScore = tokens.reduce(log(typeProbablity)) { total, word in
                total + log(P(type, word) + 1.0) / (typeProbablity + 1.0 * Double(totalWordCount))
            }
            
            if typeScore > maxTypeScore {
                maxType = type
                maxTypeScore = typeScore
            }
        }
        return maxType
    }
    
    // MARK: - Bayes Probablities
    private func P(_ type: String, _ word: String) -> Double {
        return Double(wordOccurCount[word]?[type] ?? 0) / Double(totalTeachingCount)
    }
    
    private func P(_ type: String) -> Double {
        return Double(typeOccurCount[type] ?? 0) / Double(totalTeachingCount)
    }
    
    // MARK: - Convert an english sentence into an array of words
    private func tokenize(_ text:String) -> [String] {
        let nlpOptions: NSLinguisticTagger.Options = [.omitWhitespace , .omitPunctuation , .omitOther]
        let nlpTaggers = NSLinguisticTagger(tagSchemes: NSLinguisticTagger.availableTagSchemes(forLanguage: "en"), options: Int(nlpOptions.rawValue))
        
        nlpTaggers.string = text
        
        var results:[String] = []
        
        nlpTaggers.enumerateTags(in: NSMakeRange(0, text.count), scheme: .lemma, options: nlpOptions) { _, range, _, _ in
            let token = (text as NSString).substring(with: range)
            results.append(token)
        }
        return results
    }
}
