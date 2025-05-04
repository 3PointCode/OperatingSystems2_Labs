#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 5
#
# Celem zajęć jest nabranie doświadczenia w pracy z mechanizmem łącz
# nienazwanych, wykorzystując przy tym szereg podstawowych narzędzi
# do przetwarzania danych tekstowych.
#
# Tradycyjnie nie przywiązujemy zbyt dużej wagi do środowiska roboczego.
# Zakładamy, że format i układ danych w podanych plikach nie ulega zmianie,
# ale same wartości, inne niż podane wprost w treści zadań, mogą ulec zmianie,
# a przygotowane zadania wciąż powinny działać poprawnie (robić to, co trzeba).
#
# Wszystkie chwyty dozwolone, ale w wyniku ma powstać tylko to, o czym jest
# mowa w treści zadania – nie generujemy żadnych dodatkowych plików pośrednich.
#

#
# Zadanie 7.
# Odnaleźć w pliku `dodatkowe/ps-aux` proces, który zużywa najwięcej czasu
# procesora (trzecia kolumna). Jako wynik zwrócić numer procesu (druga kolumna)
# oraz po spacji pełną nazwę procesu (wszystko od 11 kolumny do końca wiersza).
#

#pominięcie nagłówka oraz sortowanie według 3 kolumny malejąco, a następnie pobranie pierwszego procesu od góry
line=$(tail -n +2 dodatkowe/ps-aux | sort -k3 -nr | head -n1)

# wyciągnięcie pid ze zwróconej linijki po ściśnięciu wielu spacji w jedną
pid=$(echo "$line" | tr -s ' ' | cut -d' ' -f2)

# ściśnięcie wielu spacji w jedną i pobranie pełnej nazwy procesu znajdującej się od 11 kolumny do końca
cmd=$(echo "$line" | tr -s ' ' | cut -d' ' -f11-)

# wyświetlenie pid oraz pełnej nazwy procesu
echo "$pid $cmd"