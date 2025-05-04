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
# Zadanie 6.
# Plik `dodatkowe/ss-tulpn` zawiera wynik przykładowego uruchomienia komendy
# `ss -tulpn` – proszę na jego podstawie określić numery portów, na których
# jakiś proces nasłuchuje na połączenia przychodzące z zewnątrz w sieci IPv4*.
# Wyświetlić same numery portów, każdy w nowej linii.
# (* – chodzi o wpisy, zawierające adres 0.0.0.0 w kolumnie 5).
#

tail -n +2 dodatkowe/ss-tulpn | grep -E '0\.0\.0\.0:[0-9]+' | tr -s  ' ' | cut -d' ' -f5 | cut -d':' -f2 | sort -u
# pominięcie pierwszej lini od początku, dopasowanie tylko tych wystąpień po których występuje co najmniej jedna cyfra
# sciśnięcie spacji, pobranie piątej kolumny LocalAddress:Port, pobranie numeru portu i posortowanie z usunięciem duplikatów