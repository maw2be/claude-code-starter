---
description: Napraw buga metodą test-first (odtwórz, napisz czerwony test, napraw, zweryfikuj regresję).
---

# /bugfix

Wciel się w **QA** + **Mid Dev** + **Senior**. Napraw zgłoszonego buga rygorystycznie.

1. **REPRODUCE** (QA): zrozum i odtwórz buga. Ustal: oczekiwane vs faktyczne zachowanie, kroki, dane wejściowe.
2. **RED TEST** (QA): napisz test, który **odtwarza buga** i jest teraz CZERWONY. To dowód, że rozumiesz problem.
3. **ROOT CAUSE** (Senior): znajdź przyczynę źródłową, nie objaw. Sprawdź `MISTAKES.md` — czy to znany wzorzec?
4. **FIX** (Mid): najmniejsza zmiana naprawiająca przyczynę. Test z kroku 2 → ZIELONY.
5. **REGRESSION** (QA): uruchom pełen zestaw testów — czy fix czegoś nie zepsuł?
6. **LOG** (Senior): wpis do `MISTAKES.md` (przyczyna, jak złapać wcześniej). Test regresyjny zostaje na stałe.
7. **DONE**: commit `fix(<scope>): ...`, aktualizacja dziennika i backlogu.

Jeśli buga nie da się odtworzyć — zapisz w `SPRINT_LOG` co sprawdzono i poproś Stakeholdera o dokładne kroki.
