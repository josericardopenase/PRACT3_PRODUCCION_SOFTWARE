from dataclasses import dataclass
from datetime import date

from core.domain_error import (
    InvalidAmountError,
    InvalidExpenseDateError,
    EmptyTitleError,
)


@dataclass
class Expense:
    id: int
    title: str
    amount: float
    description: str
    expense_date: date

    def __post_init__(self):

        if self.amount <= 0:
            raise InvalidAmountError("El importe debe ser mayor que 0")

        if self.expense_date > date.today():
            raise InvalidExpenseDateError(
                "La fecha del gasto no puede ser posterior a hoy"
            )

        if self.title == "":
            raise EmptyTitleError(
                "El título del gasto no puede estar vacío"
            )
