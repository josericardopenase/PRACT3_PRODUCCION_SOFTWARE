class DomainError(Exception):
    """Error base del dominio"""

    pass


class EmptyTitleError(DomainError):
    pass


class InvalidAmountError(DomainError):
    pass


class InvalidExpenseDateError(DomainError):
    pass

class InvalidIdError(DomainError):
    pass