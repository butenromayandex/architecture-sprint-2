#!/bin/bash

echo 'Время запроза (без кеширования)'
curl -o /dev/null -s -w 'Время: %{time_total}s\n' 'http://localhost:8080/helloDoc/users'

echo 'Время запроса (с кешиированием)'
curl -o /dev/null -s -w 'Время: %{time_total}s\n' 'http://localhost:8080/helloDoc/users'