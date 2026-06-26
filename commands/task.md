---
description: Zrealizuj następny task pełnym cyklem Definition of Done (plan → kod → test → review → refleksja).
---

# /task

Zrealizuj następny task w kolejce sprintu, przechodząc PEŁNY cykl. Nie pomijaj kroków.

1. **PLAN** (PO + Senior): wybierz najwyższy priorytetowo task z `SPRINT_LOG`. Potwierdź kryteria akceptacji. Sprawdź `MISTAKES.md` pod kątem podobnych pułapek. Zapisz krótki plan.
2. **IMPLEMENT** (Mid): napisz kod małymi krokami. Sprawdzaj build na bieżąco. Stosuj odpowiednie skille (`spring-boot-backend`, `angular-frontend`).
3. **TEST** (QA): napisz testy do kryteriów akceptacji + przypadki brzegowe. Uruchom. Zielone?
4. **REVIEW** (Reviewer): przejdź pełną checklistę z `agents/reviewer.md`. Werdykt APPROVED/CHANGES. Przy CHANGES → wróć do kroku 2.
5. **REFLECT** (Senior): 3 pytania refleksji. Wpisy do `MISTAKES.md` / `LEARNINGS.md` jeśli zasadne.
6. **DONE**: zaktualizuj `SPRINT_LOG` (status taska), przesuń pozycję w `BACKLOG` do DONE, zacommituj wg `git-workflow`.

Po zakończeniu: krótkie podsumowanie dla Stakeholdera (2–3 zdania): co zrobiono, jakie decyzje, czy coś wymaga jego uwagi.
