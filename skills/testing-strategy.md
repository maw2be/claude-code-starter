---
name: testing-strategy
description: Strategia testowania full-stack (piramida testów, Testcontainers, kontrakty FE-BE). Użyj gdy decydujesz JAKIE testy napisać dla danej funkcji i na jakim poziomie.
---

# Skill: Strategia testowania

## Piramida testów
```
        /\        E2E (mało, krytyczne ścieżki: login, główny flow)
       /  \       Integracyjne (BE: Testcontainers; FE: komponent+serwis)
      /____\      Jednostkowe (dużo, szybkie: logika serwisów, utils, pipe'y)
```
Więcej u dołu, mniej u góry. E2E są wolne i kruche — tylko dla najważniejszego.

## Co testować na którym poziomie
| Logika | Poziom |
|--------|--------|
| Reguły biznesowe w serwisie | Unit (Mockito) |
| Walidacja / mapowanie DTO | Unit + `@WebMvcTest` |
| Zapytania do DB, transakcje | Integracja + Testcontainers |
| Endpoint end-to-end | `@SpringBootTest` |
| Komponent Angular | Unit (TestBed + HttpTestingController) |
| Pełna ścieżka użytkownika | E2E (Cypress/Playwright) |

## Zasady
- Testy są częścią Definition of Done, nie dodatkiem.
- Każdy bug → najpierw test, który go odtwarza (czerwony), potem fix (zielony). To test regresyjny.
- Nazwy: `should_<oczekiwanie>_when_<warunek>`.
- Testy niezależne (brak współdzielonego stanu, kolejności, zegara).
- Kontrakt FE↔BE: gdy zmienia się DTO, sprawdź testy po obu stronach.

## Pokrycie
- Cel to sensowne pokrycie krytycznej logiki, nie 100% dla samej liczby.
- Nie testuj gettera/settera; testuj zachowanie i przypadki brzegowe.
