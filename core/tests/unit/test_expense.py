import pytest
from datetime import date, timedelta

from core.expense import Expense
from core.domain_error import (
    EmptyTitleError,
    InvalidAmountError,
    InvalidExpenseDateError,
)


def test_create_valid_expense():
    expense = Expense(
        id=1,
        title="Comida",
        amount=10.5,
        description="Almuerzo",
        expense_date=date.today(),
    )

    assert expense.title == "Comida"
    assert expense.amount == 10.5


def test_empty_title_raises_error():
    with pytest.raises(EmptyTitleError):
        Expense(id=1, title="", amount=10, description="", expense_date=date.today())


def test_negative_amount_raises_error():
    """
    Prueba que crear un objeto Expense con un valor negativo en el campo 'amount' (por ejemplo, -5)
    genera la excepción específica InvalidAmountError definida en domain_error.py.

    - Se espera que si se intenta instanciar un gasto con un monto negativo, el constructor de Expense
      detecte esta situación inválida y lance el error adecuado, impidiendo la creación del objeto.
    - Esta validación garantiza que no se puedan registrar gastos donde la cantidad gastada sea menor a cero,
      manteniendo la integridad del dominio de gastos.
    - Revisar si esta restricción ya está implementada en la clase Expense.
    """
    with pytest.raises(InvalidAmountError):
        Expense(
            id=1,
            title="Comida",
            amount=-5,
            description="Almuerzo",
            expense_date=date.today(),
        )


def test_future_date_raises_error():
    """
    Prueba que al intentar crear un objeto Expense con un campo 'expense_date' posterior a la fecha actual
    (por ejemplo, usando date.today() + timedelta(days=1)), se lanza la excepción InvalidExpenseDateError
    definida en domain_error.py.

    - El test valida que la lógica de dominio imposibilite registrar gastos con fecha futura respecto al momento
      de ejecución de la prueba.
    - El objetivo es impedir que puedan existir gastos con fechas que aún no han ocurrido, asegurando la coherencia
      temporal de los datos en el sistema.
    - Verificar si ya se encuentra implementada esta validación en la clase Expense.
    """
    with pytest.raises(InvalidExpenseDateError):
        Expense(
            id=1,
            title="Comida",
            amount=10,
            description="Almuerzo",
            expense_date=(date.today() + timedelta(days=1)),
        )
