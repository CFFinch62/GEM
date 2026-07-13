"""Ruby LanguageProvider: syntax highlighting and script execution for Gem IDE."""

from __future__ import annotations

import re
import tempfile
from pathlib import Path
from typing import Optional

from PyQt6.QtCore import QProcess
from PyQt6.QtGui import QTextDocument

from app.language import LanguageProvider
from app.syntax import HighlightRule, RuleBasedHighlighter, keyword_rule
from app.themes import SyntaxColors

RUBY_KEYWORDS = [
    "def", "end", "if", "elsif", "else", "unless", "while", "until", "for", "in",
    "do", "begin", "rescue", "ensure", "raise", "class", "module", "self", "super",
    "return", "yield", "break", "next", "redo", "retry", "case", "when", "then",
    "and", "or", "not", "true", "false", "nil", "require", "require_relative",
    "attr_accessor", "attr_reader", "attr_writer", "private", "public", "protected",
    "lambda", "proc", "loop",
]

RUBY_BUILTINS = [
    "puts", "print", "p", "pp", "gets", "new", "each", "map", "select", "reject",
    "reduce", "inject", "to_s", "to_i", "to_a", "to_h", "to_sym", "inspect",
    "is_a?", "nil?", "respond_to?", "freeze", "dup", "clone", "Integer", "Float",
    "String", "Array", "Hash", "Symbol", "Proc", "Kernel", "Comparable", "Enumerable",
]


def _ruby_rules() -> list[HighlightRule]:
    return [
        keyword_rule(RUBY_KEYWORDS, "keyword"),
        keyword_rule(RUBY_BUILTINS, "builtin"),
        HighlightRule(re.compile(r"\b\d+\.?\d*\b"), "number"),
        HighlightRule(re.compile(r"\B:[a-zA-Z_]\w*[?!]?"), "literal"),
        HighlightRule(re.compile(r"[@$]{1,2}[a-zA-Z_]\w*"), "literal"),
        HighlightRule(re.compile(r"'(?:\\.|[^'\\])*'"), "string"),
        HighlightRule(re.compile(r'"(?:\\.|[^"\\])*"'), "string"),
        HighlightRule(re.compile(r"#.*"), "comment"),
    ]


class RubyHighlighter(RuleBasedHighlighter):
    def __init__(self, document: QTextDocument, syntax_colors: SyntaxColors):
        super().__init__(document, syntax_colors, _ruby_rules())


class RubyLanguageProvider(LanguageProvider):
    """Runs Ruby scripts with the system `ruby` interpreter via QProcess."""

    def __init__(self, interpreter: str = "ruby"):
        self._interpreter = interpreter
        self._process: Optional[QProcess] = None
        self._temp_path: Optional[Path] = None

    @property
    def name(self) -> str:
        return "Ruby"

    @property
    def file_extensions(self) -> list[str]:
        return [".rb"]

    def create_highlighter(self, document: QTextDocument, syntax_colors: SyntaxColors) -> RubyHighlighter:
        return RubyHighlighter(document, syntax_colors)

    def run(self, source: str, terminal) -> None:
        self._stop_process()

        tmp = tempfile.NamedTemporaryFile(mode="w", suffix=".rb", delete=False, encoding="utf-8")
        tmp.write(source)
        tmp.close()
        self._temp_path = Path(tmp.name)

        process = QProcess()
        process.setProgram(self._interpreter)
        process.setArguments([str(self._temp_path)])
        process.readyReadStandardOutput.connect(lambda: self._forward_output(process, terminal))
        process.readyReadStandardError.connect(lambda: self._forward_error(process, terminal))
        process.finished.connect(lambda code, _status: self._on_finished(code, terminal))
        process.errorOccurred.connect(lambda _err: terminal.write(f"[error] {process.errorString()}"))
        self._process = process
        process.start()

    def handle_input(self, text: str, terminal) -> None:
        if self._process is not None and self._process.state() == QProcess.ProcessState.Running:
            self._process.write((text + "\n").encode("utf-8"))
        else:
            terminal.write("[No running Ruby process to receive input]")

    def _forward_output(self, process: QProcess, terminal) -> None:
        data = bytes(process.readAllStandardOutput().data())
        if data:
            terminal.write(data.decode("utf-8", errors="replace").rstrip("\n"))

    def _forward_error(self, process: QProcess, terminal) -> None:
        data = bytes(process.readAllStandardError().data())
        if data:
            terminal.write(data.decode("utf-8", errors="replace").rstrip("\n"))

    def _on_finished(self, exit_code: int, terminal) -> None:
        terminal.write(f"\n[Process exited with code {exit_code}]")
        self._cleanup_temp_file()
        self._process = None

    def _stop_process(self) -> None:
        if self._process is not None:
            self._process.kill()
            self._process.waitForFinished(1000)
            self._process = None
        self._cleanup_temp_file()

    def _cleanup_temp_file(self) -> None:
        if self._temp_path is not None and self._temp_path.exists():
            self._temp_path.unlink(missing_ok=True)
        self._temp_path = None
