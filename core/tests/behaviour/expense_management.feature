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
    When añado un gasto de 10 euros llamado Pelota
    And añado un gasto de 10 euros llamado Pala
    And añado un gasto de 10 euros llamado Red
    Then el total de dinero gastado debe ser 30 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Lapiz
    And añado un gasto de 30 euros llamado Goma
    And añado un gasto de 30 euros llamado Bolígrafo
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros
    And debe haber 2 gastos registrados

    Scenario: Crear tres gastos diferentes y comprobar que el total que llevo gastado es 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Agua
    And añado un gasto de 15 euros llamado Libro
    And añado un gasto de 15 euros llamado Transporte
    Then el total de dinero gastado debe ser 40 euros
    And debe haber 3 gastos registrados

  Scenario: Crear un gasto y eliminar uno inexistente, comprobar que el total no cambia
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Snack
    And elimino el gasto con id 2
    Then el total de dinero gastado debe ser 10 euros
    And debe haber 1 gastos registrados

  Scenario: Crear tres gastos, eliminar uno intermedio y comprobar total y cantidad
    Given un gestor de gastos vacío
    When añado un gasto de 8 euros llamado Café
    And añado un gasto de 12 euros llamado Almuerzo
    And añado un gasto de 5 euros llamado Transporte
    And elimino el gasto con id 2
    Then el total de dinero gastado debe ser 13 euros
    And debe haber 2 gastos registrados