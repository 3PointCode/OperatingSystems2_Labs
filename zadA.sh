#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 2
#
# Celem zajęć jest nabranie doświadczenia w podstawowej pracy z powłoką Bash,
# w szczególności w nawigowaniu po drzewie katalogów i sprawdzaniu uprawnień.
# Proszę unikać wykorzystywania narzędzia `find` w ramach bieżących zajęć.
#
# Nie przywiązujemy wagi do środowiska roboczego – zakładamy, że jego pliki,
# inne niż te podane wprost w treści zadań, mogą ulec zmianie, a przygotowane
# rozwiązania nadal powinny działać poprawnie (robić to, o czym zadanie mówi).
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#

#
# Zadanie 10.
# W katalogu `dane/deep/` i wszystkich jego podkatalogach odnaleźć wszystkie
# pliki zwykłe, których nie możemy przeczytać ze względu na brak uprawnień
# dostępu. Zwrócić ścieżki do odnalezionych plików względem katalogu `dane/`.
# Opracowany skrypt powinien działać niezależnie od istniejącej liczby
# i poziomów podkatalogów.
#
# Wskazówka: pomocne może być zdefiniowanie funkcji i jej rekurencje wywołanie.
#

# funkcja przeszukująca katalogi rekurencyjnie
search_directory() {
    local directory="$1"    # ustawienie pierwszego argumentu jako katalog do przeszukania, ustawienie zmiennej jako lokalna dla funkcji

    for element in "$directory"/* "$directory"/.*; do   # przejście przez wszystkie elementy zadanego katalogu katalogu z uwzględnieniem katalogów ukrytych
        if [ "$element" = "$directory/." ] || [ "$element" = "$directory/.." ]; then     # pominięcie katalogu bieżącego oraz nadrzędnego
            continue
        fi

        if [ -d "$element" ]; then      # jeśli element jest katalogiem -d (directory) to na nowo wywołujemy funkcję przeszukującą
            search_directory "$element" # rekurencyjne wywołanie funkcji dla bieżącego katalogu
        elif [ -f "$element" ] && [ ! -r "$element" ]; then     # sprawdzenie czy elementy jest plikiem zwykłym i czy nie posiadamy uprawnień do jego odczytu
            echo "${element#dane/}"     # jeśli tak, wypisujemy ścieżkę pliku względem katalogu dane
        fi

    done
}

search_directory "dane/deep"   # rozpoczęcie przeszukiwania od katalogu dane/deep