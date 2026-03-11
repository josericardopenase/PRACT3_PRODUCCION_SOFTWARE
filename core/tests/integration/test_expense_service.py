from datetime import date
from core.expense import Expense
from core.expense_service import ExpenseService
from core.no_tocar.sqlite_expense_repository import SQLiteExpenseRepository


def create_service():
    repo = SQLiteExpenseRepository()
    repo.empty()
    return ExpenseService(repo)


def test_create_and_list_expenses():
    service = create_service()

    service.create_expense(
        title="Comida", amount=10, description="", expense_date=date.today()
    )

    expenses = service.list_expenses()

    assert len(expenses) == 1
    assert expenses[0].title == "Comida"


def test_remove_expense():
    service = create_service()

    service.create_expense("A", 5, "", date.today())
    service.create_expense("B", 7, "", date.today())

    service.remove_expense(1)

    expenses = service.list_expenses()
    assert len(expenses) == 1
    assert expenses[0].title == "B"


def test_update_expense():
    service = create_service()

    service.create_expense("Café", 2, "", date.today())

    service.update_expense(expense_id=1, title="Café grande", amount=3)

    expense = service.list_expenses()[0]
    assert expense.title == "Café grande"
    assert expense.amount == 3


def test_update_non_existing_expense_does_nothing():
    service = create_service()

    service.update_expense(expense_id=999, title="Nada")

    assert service.list_expenses() == []


def test_total_amount():
    service = create_service()

    service.create_expense("A", 10, "", date.today())
    service.create_expense("B", 5, "", date.today())

    assert service.total_amount() == 15


def test_total_by_month():
    service = create_service()

    service.create_expense("Enero 1", 10, "", date(2025, 1, 10))
    service.create_expense("Enero 2", 5, "", date(2025, 1, 20))
    service.create_expense("Febrero", 7, "", date(2025, 2, 1))

    totals = service.total_by_month()

    assert totals["2025-01"] == 15
    assert totals["2025-02"] == 7


def test_create_multiple_expenses_and_list():
    """
    Verifica que el servicio permite crear múltiples gastos y que estos se almacenan y recuperan correctamente mediante el método list_expenses.

    - Se crea una instancia nueva del servicio de gastos.
    - Se agregan dos gastos distintos: uno titulado "Pan" con monto 3 y descripción "Mercado", y otro titulado "Leche" con monto 4 y descripción "Supermercado".
    - Luego, se obtiene el listado de todos los gastos almacenados y se comprueba lo siguiente:
        - Ambos títulos ("Pan" y "Leche") están presentes en la lista de gastos retornada.
        - El número total de gastos en el sistema es exactamente dos, lo que verifica que no se sobrescriben ni se duplican registros al crear múltiples gastos.
    - Este test valida que la función de listado refleja fielmente todos los gastos registrados hasta el momento.
    """
    service = create_service()
    service.create_expense("pan", 3, "Mercado", date(2025, 1, 10))
    service.create_expense("leche", 4, "Supemercado", date(2025, 1, 20))
    assert len(service.list_expenses()) == 2
    pan = service.list_expenses()[0]
    assert (
        pan.title == "pan"
        and pan.amount == 3
        and pan.description == "Mercado"
        and pan.expense_date == date(2025, 1, 10)
    )
    leche = service.list_expenses()[1]
    leche_data = (leche.title, leche.amount, leche.description, leche.expense_date)
    assert leche_data == ("leche", 4, "Supemercado", date(2025, 1, 20))


def test_remove_expense_reduces_total():
    """
    Evalúa el comportamiento del sistema al eliminar un gasto existente:

    - Se generan dos gastos, "Libro" y "Revista", con cantidades distintas.
    - Se obtienen los gastos actuales y se elimina el primero de ellos utilizando su identificador.
    - Se verifica lo siguiente tras la eliminación:
        - Solo queda un gasto en el sistema.
        - El gasto remanente corresponde efectivamente a "Revista", asegurando que el elemento correcto fue eliminado
          y que la operación no afecta otros registros.
    - La prueba valida tanto la integridad de la operación de borrado como la actualización exacta del listado.
    """
    service = create_service()
    service.create_expense("Libro", 3, "", date(2025, 1, 10))
    service.create_expense("Revista", 4, "", date(2025, 1, 20))
    service.remove_expense(service.list_expenses()[0].id)
    revista = service.list_expenses()[0]
    revista_data = (
        revista.title,
        revista.amount,
        revista.description,
        revista.expense_date,
    )
    assert len((service.list_expenses())) and revista_data == (
        "Revista",
        4,
        "",
        date(2025, 1, 20),
    )


def test_update_expense_partial_fields():
    """
    Comprueba que al actualizar parcialmente un gasto solo cambian los campos especificados y el resto permanece igual.

    - Se crea un gasto titulado "Camiseta" con monto 15 y descripción "Ropa".
    - Luego, se actualiza únicamente el campo amount, estableciéndolo en 18, usando el ID del gasto.
    - Finalmente, se recupera el gasto y se verifica lo siguiente:
        - El campo 'title' permanece igual ("Camiseta").
        - El campo 'amount' se actualiza correctamente a 18.
        - El campo 'description' permanece sin cambios ("Ropa").
    - Este test asegura que el método update_expense respeta la inmutabilidad de los campos no especificados, realizando actualizaciones parciales de manera precisa.
    """
    service = create_service()
    service.create_expense("Camiseta", 15, "Ropa", date(2025, 1, 10))
    service.update_expense(service.list_expenses()[0].id, amount=18)
    camiseta = service.list_expenses()[0]
    assert (
        camiseta.title == "Camiseta"
        and camiseta.amount == 18
        and camiseta.description == "Ropa"
    )


def test_total_amount_after_removal():
    """
    Verifica que el cálculo del total gastado se actualiza correctamente después de eliminar un gasto.

    - Se crean dos gastos ("Cursos" por 30 y "Internet" por 25).
    - Se comprueba que la suma inicial del total es 55.
    - Se elimina el gasto con id 1 (correspondiente al gasto "Cursos").
    - Se recalcula el total y se espera que sea 25, reflejando únicamente el monto del gasto aún presente.
    - Este test valida que el método total_amount refleja los cambios en el sistema ante eliminaciones, manteniendo la consistencia de los datos agregados.
    """
    service = create_service()
    service.create_expense("Cursos", 30, "", date(2025, 1, 10))
    service.create_expense("Internet", 25, "", date(2025, 1, 20))
    assert service.total_amount() == 55
    service.remove_expense(1)
    assert service.total_amount() == 25
