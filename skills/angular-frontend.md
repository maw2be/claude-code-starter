---
name: angular-frontend
description: Konwencje i wzorce dla frontendu Angular (standalone components, signals, RxJS, TypeScript ścisły). Użyj przy tworzeniu/edycji komponentów, serwisów, routingu, formularzy i integracji HTTP z backendem Spring.
---

# Skill: Angular Frontend

## Struktura (feature-based)
```
src/app
├── core/            # singletony: guards, interceptors, core services
├── shared/          # reużywalne komponenty, pipe'y, dyrektywy
├── features/
│   └── <feature>/
│       ├── components/
│       ├── services/
│       ├── models/
│       └── <feature>.routes.ts
├── models/          # globalne interfejsy/typy
└── app.config.ts
```

## Zasady
- **Standalone components** (bez NgModule), `changeDetection: OnPush`.
- **Signals** do stanu lokalnego; `computed()` do pochodnych; `effect()` ostrożnie.
- **Ścisłe typowanie**: `strict: true`, zero `any`. Interfejsy dla DTO odpowiadające backendowym.
- Komponenty „prezentacyjne" (input/output) vs „kontenery" (pobierają dane). Trzymaj logikę w serwisach.
- Reactive Forms dla złożonych formularzy; walidacja po stronie FE jako UX (serwer i tak waliduje).

## HTTP / integracja z backendem
- Serwisy z `HttpClient`, zwracają typowane `Observable<T>` lub przez `firstValueFrom`/signals.
- Interceptor: dołączanie tokena (JWT), obsługa 401/403, globalne błędy.
- Modele FE muszą odpowiadać DTO backendu — przy zmianie kontraktu aktualizuj oba.
- Bazowy URL API w `environment.ts`.

## RxJS
- Subskrypcje sprzątane: `takeUntilDestroyed()` lub `async` pipe w template.
- Unikaj zagnieżdżonych `subscribe`; używaj operatorów (`switchMap`, `mergeMap`, `combineLatest`).
- `switchMap` dla żądań zależnych (anuluje poprzednie — dobre dla search).

## Testy
- Unit: Jest/Karma + `TestBed`; mockuj serwisy/HTTP (`HttpTestingController`).
- E2E: Cypress/Playwright dla krytycznych ścieżek (login, główny flow).

## Częste pułapki (sprawdzaj!)
- Memory leaks z niesprzątanych subskrypcji.
- `OnPush` + mutacja obiektu zamiast nowej referencji → brak odświeżenia. Używaj immutable/signals.
- Wołanie API w konstruktorze zamiast `ngOnInit`/effect.
- Brak obsługi stanu loading/error w UI.
- Niespójność typów FE↔BE po zmianie DTO.
