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
    When añado un gasto de 10 euros llamado Café
    And añado un gasto de 10 euros llamado Comida
    And añado un gasto de 10 euros llamado Postre
    Then el total de dinero gastado debe ser 30 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Café
    And añado un gasto de 30 euros llamado Comida
    And añado un gasto de 30 euros llamado Postre
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Café
    And añado un gasto de 30 euros llamado Comida
    And añado un gasto de 30 euros llamado Postre
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Actualizar un gasto existente y comprobar el total
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Cena
    And actualizo el gasto con id 1 a 20 euros
    Then el total de dinero gastado debe ser 20 euros
  
  Scenario: Intentar eliminar un gasto que no existe
    Given un gestor de gastos vacío
    When elimino el gasto con id 1
    Then debe haber 0 gastos registrados

  Scenario: Comprobar el total por mes
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Café
    And añado un gasto de 20 euros llamado Comida
    And calculo el total por mes
    Then 2026-03 debe sumar 30 euros
  
  Scenario: Crear gastos en meses diferentes y comprobar el total por cada mes
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Café con fecha "2026-03-01"
    And añado un gasto de 20 euros llamado Comida con fecha "2026-03-08"
    And calculo el total por mes
    Then 2026-03 debe sumar 30 euros