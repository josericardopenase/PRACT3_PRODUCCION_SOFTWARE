Feature: Gestión de gastos
  Como estudiante
  Quiero registrar mis gastos
  Para controlar cuánto dinero gasto

  Scenario: Crear un gasto y comprobar cual es el total que llevo gastado
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    Then el total de dinero gastado debe ser 5 euros

  Scenario: Eliminar un gasto y comprobar cual es el total que llevo gastado
    Given un gestor con un gasto de 5 euros
    When elimino el gasto con id 1
    Then debe haber 0 gastos registrados

  Scenario: Crear y eliminar un gasto y comprobar que no he gastado dinero
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And elimino el gasto con id 1
    Then debe haber 0 gastos registrados

  Scenario: Crear dos gastos diferentes y comprobar que el total que llevo gastado es la suma de ambos
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And añado un gasto de 10 euros llamado Comida
    Then el total de dinero gastado debe ser 15 euros

  Scenario: Crear tres gastos diferentes que sumen 30 euros hace que el total sean 30 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Comba
    And añado un gasto de 10 euros llamado Pelotas de tenis
    And añado un gasto de 10 euros llamado Pelota de futbol
    Then el total de dinero gastado debe ser 30 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Raqueta tenis
    And añado un gasto de 30 euros llamado Pelotas
    And añado un gasto de 30 euros llamado Raqueta padel
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Raqueta tenis
    And añado un gasto de 30 euros llamado Pelotas
    And añado un gasto de 30 euros llamado Raqueta padel
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Sobre un gestor con 20 euros crea tres gastos de 60, 60, 40 euros elimino el primero y el segundo la suma son 100
    Given un gestor con un gasto de 20 euros
    When añado un gasto de 60 euros llamado Bola de bolos
    And añado un gasto de 60 euros llamado Raton gaming
    And añado un gasto de 40 euros llamado Creatina
    And elimino el gasto con id 1
    And elimino el gasto con id 2
    Then el total de dinero gastado debe ser 100 euros

  Scenario: Crea dos gastos de 60, 60 euros elimino el primero y comprobamos que en el mes actual Marzo la suma es 70
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Bolos en la fecha 2026-03-09
    And añado un gasto de 60 euros llamado Mando de televisión en la fecha 2026-03-09
    Then 2026-03 debe sumar 70 euros



