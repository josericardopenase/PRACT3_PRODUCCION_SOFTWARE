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
    When añado un gasto de 2 euros llamado Piruleta
    And añado un gasto de 5 euros llamado Helado
    And añado un gasto de 23 euros llamado Tarta
    Then el total de dinero gastado debe ser 30 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Libreta
    And añado un gasto de 30 euros llamado Estuche
    And añado un gasto de 30 euros llamado Mochila
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Libreta
    And añado un gasto de 30 euros llamado Estuche
    And añado un gasto de 30 euros llamado Mochila
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Crear dos gastos de 10, 20 euros y modifico el último a 15 euros la suma son 25 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Pizza
    And añado un gasto de 20 euros llamado Costillas
    And modifico el gasto con id 2 a 15 euros
    Then el total de dinero gastado debe ser 25 euros
    
  Scenario: Crear gastos en meses diferentes y comprobar el total del mes actual
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Zanahorias a fecha 2023-01-30
    And añado un gasto de 15 euros llamado Sandía a fecha 2025-02-12
    And añado un gasto de 12 euros llamado Berenjenas a fecha 2026-03-02
    And añado un gasto de 13 euros llamado Melón a fecha 2026-03-08
    Then 2026-03 debe sumar 25 euros

  Scenario: Crear gastos en meses diferentes y comprobar el total de un mes pasado
    Given un gestor de gastos vacío
    When añado un gasto de 36 euros llamado Lámpara a fecha 2024-05-12
    And añado un gasto de 64 euros llamado Silla a fecha 2024-05-04
    And añado un gasto de 19 euros llamado Jarrón a fecha 2026-03-02
    And añado un gasto de 57 euros llamado Escultura a fecha 2026-03-08
    Then 2024-05 debe sumar 100 euros