import Foundation

extension NumberFormatter {

    static let percentage: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.locale = .current
        return formatter
    }()
}
