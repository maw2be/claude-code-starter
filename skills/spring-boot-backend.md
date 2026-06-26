---
name: spring-boot-backend
description: Konwencje i wzorce dla backendu Java 21 + Spring Boot 3.x. Użyj przy tworzeniu lub edycji kontrolerów, serwisów, repozytoriów, encji, konfiguracji bezpieczeństwa i obsługi błędów po stronie backendu.
---

# Skill: Spring Boot Backend

## Struktura pakietów (domyślna)
```
com.example.app
├── config/            # konfiguracja Spring, Security, CORS
├── domain/            # encje JPA, value objects, enumy
├── repository/        # interfejsy Spring Data
├── service/           # logika biznesowa (interfejs + impl jeśli sensowne)
├── web/
│   ├── controller/    # @RestController, cienkie
│   ├── dto/           # request/response DTO
│   └── mapper/        # encja <-> DTO (MapStruct lub ręcznie)
├── exception/         # wyjątki domenowe + @RestControllerAdvice
└── Application.java
```
Jeśli projekt jest modularny (DDD/hexagonal) — dostosuj się do istniejącego podziału.

## Zasady warstw
- **Controller**: walidacja (`@Valid`), mapowanie DTO, delegacja do serwisu. Zero logiki biznesowej.
- **Service**: logika, transakcje (`@Transactional` w serwisie, nie w repo/kontrolerze).
- **Repository**: Spring Data; własne zapytania przez `@Query` lub Specifications, nigdy konkatenacja SQL.

## DTO i mapowanie
- Nie zwracaj encji JPA z API (lazy loading, wyciek wewnętrznej struktury, ryzyko nadmiarowych pól).
- Request DTO z walidacją (`@NotNull`, `@Size`, `@Email`...).
- Response DTO minimalne — tylko to, co klient potrzebuje.

## Obsługa błędów
```java
@RestControllerAdvice
class GlobalExceptionHandler {
  @ExceptionHandler(ResourceNotFoundException.class)
  ResponseEntity<ApiError> handle(ResourceNotFoundException ex) { ... } // 404
  @ExceptionHandler(MethodArgumentNotValidException.class)
  ResponseEntity<ApiError> handleValidation(...) { ... } // 400 z polami
}
```
Spójny kształt błędu: `{ timestamp, status, code, message, fieldErrors[] }`.

## Bezpieczeństwo
- Spring Security; endpointy domyślnie zabezpieczone, publiczne jawnie odblokowane.
- Hasła: BCrypt. Sekrety: zmienne środowiskowe / `application-*.yml` poza repo.
- CORS skonfigurowany świadomie (origin Angulara).
- Walidacja zawsze po stronie serwera (FE walidacja to UX, nie bezpieczeństwo).

## Testy
- `@WebMvcTest` dla kontrolerów (z mockiem serwisu).
- Unit serwisów z Mockito.
- `@SpringBootTest` + Testcontainers (PostgreSQL) dla integracji z realną bazą.

## Częste pułapki (sprawdzaj!)
- N+1 zapytań → `@EntityGraph` / fetch joins.
- Brak `@Transactional` przy operacjach wielokrokowych.
- Encje z `@Data` (Lombok) + relacje → pętle w `equals/hashCode/toString`. Używaj ostrożnie.
- Otwieranie `OSIV` (open-session-in-view) — preferuj wyłączenie i jawne ładowanie.
