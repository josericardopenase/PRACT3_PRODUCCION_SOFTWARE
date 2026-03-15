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
    When añado un gasto de 10 euros llamado Cine
    And añado un gasto de 15 euros llamado Cena
    And añado un gasto de 5 euros llamado Taxi
    Then el total de dinero gastado debe ser 30 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Internet
    And añado un gasto de 30 euros llamado Luz
    And añado un gasto de 30 euros llamado Agua
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Crear tres gastos y comprobar la cantidad de registros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Gimnasio
    And añado un gasto de 30 euros llamado Compra
    And añado un gasto de 30 euros llamado Almuerzo
    Then debe haber 3 gastos registrados
  
  Scenario: Actualizar el importe de un gasto correctamente
    Given un gestor con un gasto de 20 euros
    When actualizo el importe del gasto con id 1 a 50 euros
    Then el total de dinero gastado debe ser 50 euros
  
  Scenario: Calcular el total de gastos por mes
    Given un gestor de gastos vacío
    When añado un gasto de 20 euros llamado Libro con fecha 2025-01-15
    And añado un gasto de 15 euros llamado Revista con fecha 2025-01-20
    And añado un gasto de 10 euros llamado Cine con fecha 2025-02-05
    And calculo los gastos totales por mes
    Then el mes 2025-01 debe tener un total de dinero gastado de 35 euros
    And el mes 2025-02 debe tener un total de dinero gastado de 10 euros

  Scenario: Eliminar todos los gastos reinicia el gestor
    Given un gestor con un gasto de 50 euros
    When añado un gasto de 20 euros llamado Cena
    And elimino todos los gastos
    Then debe haber 0 gastos registrados
    And el total de dinero gastado debe ser 0 euros
  
  Scenario: Crear gastos con el mismo título y comprobar que se registran de forma independiente
    Given un gestor de gastos vacío
    When añado un gasto de 15 euros llamado Almuerzo
    And añado un gasto de 12 euros llamado Almuerzo
    Then debe haber 2 gastos registrados
    And el total de dinero gastado debe ser 27 euros
