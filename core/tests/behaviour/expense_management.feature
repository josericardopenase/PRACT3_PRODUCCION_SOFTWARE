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
    And añado un gasto de 10 euros llamado Gasolina
    And añado un gasto de 10 euros llamado Suscripciones
    Then el total de dinero gastado debe ser 30 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el primer gasto la suma son 60 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Comida
    And añado un gasto de 30 euros llamado Gasolina
    And añado un gasto de 30 euros llamado Suscripciones
    And elimino un gasto de 10 euros llamado Comida
    Then el total de dinero gastado debe ser 60 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Comida
    And añado un gasto de 30 euros llamado Gasolina
    And añado un gasto de 30 euros llamado Suscripciones
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Crear un gasto de título "Videojuegos" y comprobar que se crea correctamente
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Videojuegos
    Then debe haber un gasto de nombre Videojuegos

  Scenario: Crear un gasto de 10 euros y actualizar el gasto a 15 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Pantalones
    And actualizo el gasto con id 1 a 15 euros
    Then el total de dinero gastado debe ser 15 euros

  Scenario: Crear tres gastos de 10 euros y eliminar el segundo y actualizar el gasto del último a 15 euros, la suma son 25 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Pantalones
    When añado un gasto de 10 euros llamado Videojuegos
    When añado un gasto de 10 euros llamado Suscripciones
    And elimino el gasto con id 2
    And actualizo el gasto con id 3 a 15 euros
    Then el total de dinero gastado debe ser 25 euros
