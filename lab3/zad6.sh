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
# Zadanie 6.
# Odnaleźć w katalogu `dane/pierwiastki/` wszystkie dowiązania miękkie, które
# wskazują na jakiś cel przy pomocy ścieżki bezwzględnej. Wyświetlić ścieżki
# z takich dowiązań, ale poprawione w taki sposób, aby były one ścieżkami
# kanonicznymi. Element wskazywany przez dowiązanie nie musi istnieć.
#

#!/usr/bin/env bash

# przejście przez wszystkie pliki w zadanym katalogu
for file in dane/pierwiastki/*; do
    if [ -L "$file" ]; then                 # sprwadzenie czy dany plik jest dowiązaniem symbolicznym
        target=$(readlink "$file")          # pobranie pliku docelowego na który wskazuje dowiązanie
        
        if [ "${target:0:1}" = "/" ]; then  # sprawdzenie czy pierwszy znak zmiennej target jest równy "/"
            readlink -m "$target"           # zwrócenie pełnej ścieżki do pliku eliminując .. i ~
        fi
    fi
done
