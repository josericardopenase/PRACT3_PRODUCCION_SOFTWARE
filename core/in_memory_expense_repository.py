from core.expense import Expense
from core.expense_service import ExpenseRepository


class InMemoryExpenseRepository(ExpenseRepository):
    def __init__(self):
        self._expenses: list[Expense] = []

    def save(self, expense: Expense) -> None:
        for index, existing in enumerate(self._expenses):
            if existing.id == expense.id:
                self._expenses[index] = expense
                return
        self._expenses.append(expense)

    def remove(self, expense_id: int) -> None:
        """
        #FIXME
        Esta función debería eliminar de la lista self._expenses el gasto con la id expense_id.

        :param expense_id:  La id del gasto
        :return: None
        """
        self._expenses = [
            expense for expense in self._expenses if expense.id != expense_id
        ]

    def get_by_id(self, expense_id: int) -> Expense | None:
        return next(
            (expense for expense in self._expenses if expense.id == expense_id), None
        )

    def list_all(self) -> list[Expense]:
        return list(self._expenses)
