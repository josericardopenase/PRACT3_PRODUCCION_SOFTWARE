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
    And añado un gasto de 10 euros llamado Almuerzo
    And añado un gasto de 10 euros llamado Cena
    Then el total de dinero gastado debe ser 30 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Café
    And añado un gasto de 30 euros llamado Almuerzo
    And añado un gasto de 30 euros llamado Cena
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Intentar crear un gasto con monto negativo debe fallar
    Given un gestor de gastos vacío
    When añado un gasto de 20 euros llamado Gasto inicial
    And añado un gasto de 15 euros llamado Gasto adicional
    Then el total de dinero gastado debe ser 35 euros

  Scenario: Intentar crear un gasto con fecha futura debe fallar
    Given un gestor con un gasto de 5 euros
    When elimino el gasto con id 1
    And añado un gasto de 10 euros llamado Nuevo gasto
    Then debe haber 1 gastos registrados

  Scenario: Obtener el detalle de un gasto específico
    Given un gestor de gastos vacío
    When añado un gasto de 25 euros llamado Gasto importante
    And añado un gasto de 15 euros llamado Otro gasto
    And añado un gasto de 10 euros llamado Último gasto
    Then el total de dinero gastado debe ser 50 euros