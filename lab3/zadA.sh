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
# Zadanie 10.
# Proszę określić, ile w katalogu `dane/icao/` jest unikalnych plików,
# rozumianych jako niepowtarzalne zaalokowanie zawartości na dysku twardym
# (to znaczy: kilka dowiązań twardych do tego samego pliku traktujemy jako 1).
# Jako wynik wyświetlić po prostu samą liczbę, nic więcej.
#

declare -A inode_set    # deklaracja tablicy asocjacyjnej przechowująca pary unikalnych kluczy (numer iwęzła) i wartości (1)

# przejście przez wszystkie pliki w zadanym katalogu
for file in dane/icao/*; do
    if [ -f "$file" ]; then                     # sprawdzenie czy obiekt jest zwykłym plikiem
        inode=$(stat --format='%i' "$file")     # przypisanie unikalnego numeru iwęzła dla file do zmiennej inode
        
        inode_set["$inode"]=1                   # ustawienie wartości dla klucza inode na 1
    fi
done

echo "${#inode_set[@]}"                         # wyświetlenie sumy wszystkich unikalnych kluczy w tablicy, @ - wszystkie klucze tablicy, {#} uzyskanie liczby elementów