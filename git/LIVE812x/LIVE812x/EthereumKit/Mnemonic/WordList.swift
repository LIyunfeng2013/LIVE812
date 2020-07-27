public enum WordList {
    case english
    case japanese
    case chinese
    case korea
    
    public var words: [String] {
        switch self {
        case .english:
            return englishWords
        case .japanese:
            return japaneseWords
        case .chinese:
            return chineseWords
        case .korea:
            return koreaWords
        }
    }
}
