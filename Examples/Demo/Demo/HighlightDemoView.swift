import SwiftUI
import MarkdownUI

struct HighlightDemoView: View {
    private let markdown = """
    # Highlight Demo

    This is a demo of the **highlight** feature.
    Try searching for words like SwiftUI, demo, or highlight!

    - You can highlight words in lists.
    - Or in *italic* and **bold** text.
    - Even in [links](https://example.com)!
    """

    private let highlights = ["highlight", "SwiftUI", "demo"]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Highlighted words: \(highlights.joined(separator: ", "))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                MarkdownContentView(markdown: markdown, highlights: highlights)
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(radius: 2)
            }
            .padding()
        }
        .navigationTitle("Highlight Demo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

/// MarkdownContentView: MarkdownUIのInlineTextを直接使ってハイライトを適用するサンプル
struct MarkdownContentView: View {
    let markdown: String
    let highlights: [String]

    var body: some View {
        let content = MarkdownContent(markdown)
        // MarkdownContentのinlinesを直接使ってInlineTextを表示
        InlineText(content.inlines, highlightedStrings: highlights)
            .font(.body)
    }
}

struct HighlightDemoView_Previews: PreviewProvider {
    static var previews: some View {
        HighlightDemoView()
    }
}
