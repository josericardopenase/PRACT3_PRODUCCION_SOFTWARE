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
    When añado un gasto de 5 euros llamado Lavado coche
    And añado un gasto de 10 euros llamado Almuerzo
    And añado un gasto de 15 euros llamado Gasolina
    Then el total de dinero gastado debe ser 30 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Bono Guagua
    And añado un gasto de 30 euros llamado Almuerzo
    And añado un gasto de 30 euros llamado Ocio
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros 

  Scenario: Crear tres gastos de 5 euros y elimino el segundo gasto la suma es de 10 euros
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Cafetería
    And añado un gasto de 5 euros llamado Cine
    And añado un gasto de 5 euros llamado Refresco
    And elimino el gasto con id 2
    Then el total de dinero gastado debe ser 10 euros
  
  Scenario: Crear tres gastos de 5, 10, y 15 euros y el total de marzo debe ser de 30 euros
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Bocadillo
    And añado un gasto de 10 euros llamado Taxi
    And añado un gasto de 15 euros llamado Fiesta
    Then march debe sumar 30 euros

  Scenario: Crear un gasto de 5 euros en enero lo modifico a 10 euros la suma de enero debe ser de 10 euros
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Bocadillo en 31-01-2026
    And modifico el gasto con id 1 a 10 euros
    Then january debe sumar 10 euros

  Scenario: Crear dos gastos de 5 euros en enero la suma de marzo debe ser 0 de euros
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Cine en 16-01-2026
    And añado un gasto de 5 euros llamado Palomitas en 16-01-2026
    Then march debe sumar 0 euros

