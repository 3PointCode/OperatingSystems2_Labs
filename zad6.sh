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
# Zadanie 6.
# Przeczytać zawartość pliku `dane/Zahlen.txt` i obliczyć sumę wszystkich
# znajdujących się tam liczb. Na koniec wyświetlić tylko wynik, nic więcej.
#

sum=0

# przejście w pętli while przez każdą linię zadanego pliku
while read number; do    # zmienna number przechowuje wartość konkretnej linii
    sum=$((sum + number))   # wykonanie operacji artymetycznych i przekazanie wyniku do zmiennej, inna wersja ((sum += number))
done < dane/Zahlen.txt      # przekazanie zawartości pliku Zahlen.txt do pętli while, użycie pliku jako żródła danych dla polecenia, które je poprzedza

echo "$sum"