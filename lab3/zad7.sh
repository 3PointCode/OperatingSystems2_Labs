#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 3
#
# Celem zajęć jest pogłębienie wiedzy na temat struktury systemu plików,
# poruszania się po katalogach i kontroli uprawnień w skryptach powłoki.
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
# Zadanie 7.
# Plik `links.txt` z katalogu `dane/` zawiera listę ścieżek. Proszę określić
# które z tych ścieżek to dowiązania do istniejących plików wykonywalnych.
# Jako wynik wyświetlić pasujące wpisy z pliku (ścieżki do dowiązań).
#

# odczyt każdej linijki zawartej w links
while read line; do
    if [ -L "$line" ]; then         # spradzenie czy dana ścieżka jest dowiązaniem symbolicznym
        file=$(realpath -m "$line") # przypisanie ścieżki bezwzględnej pliku docelowego

        if [ -x "$file" ]; then     # sprawdzenie czy plik na który wskazuje dowiązanie jest wykonywalny
            echo "$line"            # wyświetlenie ścieżki dowiązania 
        fi
    fi
done < "dane/links.txt"