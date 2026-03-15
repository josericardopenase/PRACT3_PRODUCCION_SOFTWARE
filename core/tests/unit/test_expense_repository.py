from datetime import date

from core.expense import Expense
from core.in_memory_expense_repository import InMemoryExpenseRepository


def create_expense(id=1, title="Test", amount=10):
    return Expense(
        id=id, title=title, amount=amount, description="", expense_date=date.today()
    )


def test_save_new_expense():
    repo = InMemoryExpenseRepository()
    expense = create_expense()
    repo.save(expense)
    expenses = repo.list_all()
    assert len(expenses) == 1
    assert expenses[0].id == 1


def test_save_updates_existing_expense():
    repo = InMemoryExpenseRepository()
    expense = create_expense()

    repo.save(expense)

    updated = create_expense(id=1, title="Updated", amount=20)
    repo.save(updated)

    expenses = repo.list_all()
    assert len(expenses) == 1
    assert expenses[0].title == "Updated"
    assert expenses[0].amount == 20


def test_remove_expense():
    repo = InMemoryExpenseRepository()
    expense = create_expense()
    repo.save(expense)
    repo.remove(expense_id=1)
    assert repo.list_all() == []


def test_list_all_returns_copy():
    repo = InMemoryExpenseRepository()
    repo.save(create_expense())
    expenses = repo.list_all()
    expenses.clear()
    assert len(repo.list_all()) == 1


def test_get_by_id_returns_expense():
    """
    Prueba que el método repo.get_by_id() retorna el gasto correcto cuando existe un gasto con el id buscado.
    Se guarda un gasto en el repositorio, luego se recupera por su id y se verifica que sea el mismo
    objeto (comparando sus atributos principales).
    """
    repo = InMemoryExpenseRepository()
    expense = create_expense()
    repo.save(expense)
    retrieved = repo.get_by_id(1)
    assert retrieved is not None
    assert retrieved.id == expense.id
    assert retrieved.title == expense.title
    assert retrieved.amount == expense.amount


def test_get_by_id_returns_none_if_not_found():
    """
    Prueba que el método repo.get_by_id() retorna None cuando se consulta un id que no corresponde a ningún gasto guardado.
    Se verifica que buscar un id inexistente no produce error, sino que devuelve None.
    """
    repo = InMemoryExpenseRepository()
    retrieved = repo.get_by_id(1000)
    assert retrieved is None
