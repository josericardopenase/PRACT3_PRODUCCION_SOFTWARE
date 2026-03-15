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
    When añado un gasto de 10 euros llamado Pedido
    And añado un gasto de 5 euros llamado Supermercado
    And añado un gasto de 15 euros llamado Peluquería
    Then el total de dinero gastado debe ser 30 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Pedido
    And añado un gasto de 30 euros llamado Gimnasio
    And añado un gasto de 30 euros llamado Imprimir
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros
  
  Scenario: Crear tres gastos y eliminar uno intermedio mantiene los otros dos
    Given un gestor de gastos vacío
    When añado un gasto de 20 euros llamado Libro
    And añado un gasto de 6 euros llamado Spotify
    And añado un gasto de 5 euros llamado Bocadillo
    And elimino el gasto con id 2
    Then debe haber 2 gastos registrados

  Scenario: Crear un gasto y eliminarlo deja el gestor vacío
    Given un gestor de gastos vacío
    When añado un gasto de 8 euros llamado Kebab
    And elimino el gasto con id 1
    Then debe haber 0 gastos registrados  
  
  Scenario: Crear cuatro gastos y comprobar que el total es correcto
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Bizum
    And añado un gasto de 10 euros llamado Imprimir
    And añado un gasto de 15 euros llamado Taxi
    And añado un gasto de 50 euros llamado Ropa
    Then el total de dinero gastado debe ser 80 euros 
