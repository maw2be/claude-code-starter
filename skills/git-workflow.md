---
name: git-workflow
description: Konwencje gita, commitów i gałęzi dla pracy w sprintach. Użyj przy commitowaniu zmian i organizacji pracy nad feature/bugfix.
---

# Skill: Git workflow

## Gałęzie
```
main           # stabilna, zawsze zielona
feature/TASK-XX-krotki-opis
bugfix/TASK-XX-krotki-opis
refactor/...
```
Jeśli projekt już ma własną strategię (np. trunk-based) — dostosuj się.

## Conventional Commits
```
<type>(<scope>): <opis w trybie rozkazującym>

[opcjonalne body — dlaczego, nie co]
```
Typy: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`, `perf`, `build`.

Przykłady:
- `feat(auth): add JWT login endpoint`
- `fix(orders): handle empty cart on checkout`
- `test(user): add edge cases for email validation`

## Zasady
- Małe, atomowe commity. Jeden commit = jedna logiczna zmiana.
- Nie commituj czerwonego kodu na main.
- Nigdy sekretów. Sprawdź `.gitignore` (target/, node_modules/, .env, *.local).
- Commit message po angielsku.
- Przed „mergem": build zielony, testy zielone, review APPROVED.
