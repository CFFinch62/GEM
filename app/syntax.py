"""Generic regex-rule syntax highlighter, driven by the active theme's SyntaxColors.

Language providers can subclass RuleBasedHighlighter with a list of HighlightRules
instead of writing highlightBlock() from scratch. Colors come from the active
theme, so highlighting stays correct across theme switches.
"""

from __future__ import annotations

import re
from dataclasses import dataclass
from typing import Dict, List, Pattern

from PyQt6.QtGui import QColor, QFont, QSyntaxHighlighter, QTextCharFormat, QTextDocument

from app.themes import SyntaxColors


@dataclass(frozen=True)
class HighlightRule:
    pattern: Pattern[str]
    color_attr: str  # attribute name on SyntaxColors, e.g. "keyword"
    bold: bool = False


class RuleBasedHighlighter(QSyntaxHighlighter):
    def __init__(self, document: QTextDocument, syntax_colors: SyntaxColors, rules: List[HighlightRule]):
        super().__init__(document)
        self._rules = rules
        self._formats: Dict[Pattern[str], QTextCharFormat] = {}
        self.set_colors(syntax_colors)

    def set_colors(self, syntax_colors: SyntaxColors) -> None:
        self._formats = {}
        for rule in self._rules:
            fmt = QTextCharFormat()
            fmt.setForeground(QColor(getattr(syntax_colors, rule.color_attr)))
            if rule.bold:
                fmt.setFontWeight(QFont.Weight.Bold)
            self._formats[rule.pattern] = fmt
        self.rehighlight()

    def highlightBlock(self, text: str) -> None:
        for rule in self._rules:
            fmt = self._formats[rule.pattern]
            for match in rule.pattern.finditer(text):
                start, end = match.span()
                self.setFormat(start, end - start, fmt)


def keyword_rule(words: List[str], color_attr: str = "keyword") -> HighlightRule:
    """Convenience: build a HighlightRule matching a set of whole-word keywords."""
    pattern = re.compile(r"\b(?:" + "|".join(re.escape(w) for w in words) + r")\b")
    return HighlightRule(pattern=pattern, color_attr=color_attr, bold=True)
