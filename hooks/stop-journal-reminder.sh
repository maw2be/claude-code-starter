#!/usr/bin/env bash
# Stop hook — uruchamiany gdy Claude Code kończy turę.
# Przypomina o dyscyplinie dziennika (uczenie się = część Definition of Done).
# Nie blokuje pracy; jedynie wstrzykuje przypomnienie do kontekstu.

cat <<'EOF'
{
  "decision": "block",
  "reason": "PRZYPOMNIENIE DEFINITION OF DONE: Zanim zakończysz — czy (1) build/testy są zielone, (2) Reviewer przeszedł checklistę, (3) zaktualizowano journal/SPRINT_LOG.md, (4) jeśli był błąd → wpis w MISTAKES.md, (5) jeśli był wniosek → wpis w LEARNINGS.md? Jeśli wszystko zrobione, zakończ normalnie. Jeśli nie — dokończ brakujące kroki."
}
EOF
