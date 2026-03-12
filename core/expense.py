from dataclasses import dataclass
from datetime import date

from core.domain_error import (
    EmptyTitleError,
    InvalidAmountError,
    InvalidExpenseDateError,
    InvalidIdError,
    InvalidDescriptionError,
)


@dataclass
class Expense:
    id: int
    title: str
    amount: float
    description: str
    expense_date: date

    def __post_init__(self):
        """
        FIXME: Revisen si falta algo que comprobar...
        """
        if not self.title.strip():
            raise EmptyTitleError("El título no puede estar vacío")

        if self.id <= 0:
            raise InvalidIdError("La id debe ser mayor que 0")

        if self.amount <= 0:
            raise InvalidAmountError("El importe debe ser mayor que 0")

        if self.expense_date > date.today():
            raise InvalidExpenseDateError(
                "La fecha del gasto no puede ser posterior a hoy"
            )

        if len(self.description) > 100:
            raise InvalidDescriptionError(
                "La descripción no puede tener más de 100 caracteres"
            )
