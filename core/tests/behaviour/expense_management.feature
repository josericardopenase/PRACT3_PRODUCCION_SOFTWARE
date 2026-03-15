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
    When añado un gasto de 10 euros llamado Comida
    And añado un gasto de 15 euros llamado Ropa
    And añado un gasto de 5 euros llamado Café
    Then el total de dinero gastado debe ser 30 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Comida
    And añado un gasto de 30 euros llamado Ropa
    And añado un gasto de 30 euros llamado Gasolina
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Comida
    And añado un gasto de 30 euros llamado Ropa
    And añado un gasto de 30 euros llamado Gasolina
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Crear tres gastos diferentes y comprobar que existen tres gastos
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Comida
    And añado un gasto de 5 euros llamado Café
    And añado un gasto de 20 euros llamado Gasolina
    Then debe haber 3 gastos registrados

  Scenario: Añadir un gasto de 5 euros a un gestor con un gasto total de 25 euros y comprobar que el total son 30 euros
    Given un gestor con un gasto de 25 euros
    When añado un gasto de 5 euros llamado Café
    Then el total de dinero gastado debe ser 30 euros

  Scenario: Crear tres gastos de 20, 15, 5 y eliminar el gasto del medio, comprobar que el total son 25 euros
    Given un gestor de gastos vacío
    When añado un gasto de 20 euros llamado Comida
    And añado un gasto de 15 euros llamado Ropa
    And añado un gasto de 5 euros llamado Café
    And elimino el gasto con id 2
    Then el total de dinero gastado debe ser 25 euros
