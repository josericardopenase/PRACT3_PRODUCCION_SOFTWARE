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
    And añado un gasto de 10 euros llamado Agua
    And añado un gasto de 10 euros llamado Bus
    Then el total de dinero gastado debe ser 30 euros
    And debe haber 3 gastos registrados

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Gasto1
    And añado un gasto de 30 euros llamado Gasto2
    And añado un gasto de 30 euros llamado Gasto3
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros
    And debe haber 2 gastos registrados

  Scenario: Crear tres gastos y eliminar el gasto del medio hace que el total se actualice correctamente
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Gasto1
    And añado un gasto de 20 euros llamado Gasto2
    And añado un gasto de 30 euros llamado Gasto3
    And elimino el gasto con id 2
    Then el total de dinero gastado debe ser 40 euros
    And debe haber 2 gastos registrados

  Scenario: Intentar eliminar un gasto con id inexistente no cambia el total ni el número de gastos
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Gasto1
    And elimino el gasto con id 99
    Then el total de dinero gastado debe ser 10 euros
    And debe haber 1 gastos registrados

  Scenario: Crear, eliminar y volver a crear un gasto mantiene el total correcto y los ids no se reutilizan
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Gasto1
    And añado un gasto de 20 euros llamado Gasto2
    And elimino el gasto con id 1
    And añado un gasto de 5 euros llamado Gasto3
    Then el total de dinero gastado debe ser 25 euros
    And debe haber 2 gastos registrados
