#!/bin/bash

echo 'Время запроза (кеширования)'
curl -o /dev/null -s -w 'Total Time: %{time_total}s\n' 'http://localhost:8080/helloDoc/users'

echo 'Время запроса (с кешиированием)'
curl -o /dev/null -s -w 'Total Time: %{time_total}s\n' 'http://localhost:8080/helloDoc/users'