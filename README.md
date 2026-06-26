# Szablon Claude Code — Wirtualny zespół full-stack (Java/Spring + Angular)

Wklejasz folder `.claude/` do katalogu projektu. Claude Code zachowuje się jak zespół Agile (PO, Senior, Mid, Reviewer, QA), pracuje w sprintach, sam się recenzuje i prowadzi dziennik, ucząc się na błędach. Twoja interwencja jest minimalna.

## Jak zacząć

### Nowy projekt
1. Wklej `.claude/` do pustego katalogu.
2. Wypełnij **`PROJECT.md`** (opis, cele, funkcje MVP).
3. Uruchom Claude Code i wpisz `/sprint-plan`, potem `/task` (lub po prostu: „zacznij budować").
4. Zespół zbuduje, czasem zada Ci 1–2 kluczowe pytania.

### Istniejący projekt
1. Wklej `.claude/` do katalogu z kodem.
2. Uruchom `/onboard` — zespół zmapuje kod do `journal/CODEBASE_MAP.md`.
3. Wpisz zadanie w **`BACKLOG.md`** (sekcja NOW).
4. Uruchom `/task`.

## Twoje dwa pliki wejściowe
- **`PROJECT.md`** — czym jest aplikacja (raz, na początku).
- **`BACKLOG.md`** — co robić dalej (na bieżąco, krótko).

To wszystko, czego zespół od Ciebie potrzebuje na co dzień.

## Komendy
| Komenda | Działanie |
|---------|-----------|
| `/sprint-plan` | Zaplanuj sprint z backlogu |
| `/task` | Zrealizuj następny task (plan→kod→test→review→refleksja) |
| `/bugfix` | Napraw buga test-first |
| `/retro` | Retrospektywa + aktualizacja wniosków |
| `/onboard` | Zmapuj istniejący projekt |

## Struktura
```
.claude/
├── CLAUDE.md              # główne zasady (zespół, workflow, DoD)
├── PROJECT.md             # ← TY: opis projektu
├── BACKLOG.md             # ← TY: kolejne zadania
├── settings.json          # uprawnienia + hook dziennika
├── agents/                # PO, senior, mid, reviewer, qa
├── skills/                # spring-boot, angular, testy, git
├── commands/              # /sprint-plan /task /bugfix /retro /onboard
├── hooks/                 # przypomnienie o Definition of Done
└── journal/               # ← ZESPÓŁ: dziennik uczenia się
    ├── SPRINT_LOG.md      # przebieg sprintów i tasków
    ├── MISTAKES.md        # błędy (czytane przed każdym taskiem)
    ├── LEARNINGS.md       # wnioski i wiedza o projekcie
    ├── DECISIONS.md       # ADR — decyzje zamiast pytań
    └── CODEBASE_MAP.md    # mapa istniejącego kodu
```

## Mechanizm uczenia się
- Po każdym tasku zespół robi **refleksję**: błędy → `MISTAKES.md`, wnioski → `LEARNINGS.md`.
- **Przed** podobnym taskiem czyta `MISTAKES.md`, by nie powtórzyć błędu.
- Decyzje techniczne lądują w `DECISIONS.md` (ADR) — możesz je przejrzeć i zakwestionować.

## Dostosowanie
- Stack/wersje zmienisz w `CLAUDE.md` §2 i w skillach.
- Zasadę „kiedy pytać Stakeholdera" wyostrzysz w `CLAUDE.md` §3.
- Hook (`settings.json`) jest opcjonalny — usuń sekcję `hooks`, jeśli nie chcesz przypomnień.
