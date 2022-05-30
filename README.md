# Own-neural-network
Celem projektu jest samodzielne zaimplementowanie prostej sieci neuronowej i przetestowanie jej na wybranym przez siebie przykładzie.

Podstawowym założeniem projektu jest własnoręczne zaimplementowanie automatycznego różniczkowania w celu wyznaczania pochodnych warstw potrzebnych do wstecznej
propagacji błędów. Zaimplementowano optymalizator opierający się na algorytmie najszybszego spadku z bezwładnością. Sieć realizuje zadanie klasyfikację cyfr (Digits MNIST dataset).
Sieć posiada dwie warstwy ukryte z kolejno liczbą 21 i 16 neuronów.  
  
Poniżej zaprezentowano proces uczenia sieci oraz błąd strat względem liczby epok:  
  
![image](https://user-images.githubusercontent.com/104941410/171037913-b1505a94-e5cd-49ed-b58d-4d9db632c941.png)





