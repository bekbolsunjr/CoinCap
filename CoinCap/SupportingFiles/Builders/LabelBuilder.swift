import UIKit

public final class LabelBuilder {
    private var label: UILabel = .init()
    
    public func setAlignment(_ alignment: NSTextAlignment) -> Self {
        label.textAlignment = alignment
        return self
    }
    
    public func setFont(_ font: UIFont) -> Self {
        label.font = font
        return self
    }
    
    public func setTextColor(_ color: UIColor) -> Self {
        label.textColor = color
        return self
    }
    
    public func setText(_ text: String) -> Self {
        label.text = text
        return self
    }
    
    public func setNumberOfLines(_ numberOfLines: Int) -> Self {
        label.numberOfLines = numberOfLines
        return self
    }
    
    public func build() -> UILabel {
        return label
    }
}
