import csv
import snake


def mkaray(w, h):
    def borderUP(x, y):
        match(x, y):
            case(_, 0):
                return 'None'
            case(_, 1):
                return snake.Cell_type.BORDER.name
            case(0, _):
                return snake.Cell_type.BORDER.name
            case(a, _) if a == w-1:
                return snake.Cell_type.BORDER.name
            case _:
                return snake.Cell_type.EMPTY.name

    def borderDOWN(x, y):
        match(x, y):
            case(_, b) if b == h-1:
                return 'None'
            case(_, b) if b == h-2:
                return snake.Cell_type.BORDER.name
            case(0, _):
                return snake.Cell_type.BORDER.name
            case(a, _) if a == w-1:
                return snake.Cell_type.BORDER.name
            case _:
                return snake.Cell_type.EMPTY.name

    def borderLEFT(x, y):
        match(x, y):
            case(0, _):
                return 'None'
            case(1, _):
                return snake.Cell_type.BORDER.name
            case(_, 0):
                return snake.Cell_type.BORDER.name
            case(_, b) if b == h-1:
                return snake.Cell_type.BORDER.name
            case _:
                return snake.Cell_type.EMPTY.name

    def borderRIGHT(x, y):
        match(x, y):
            case(a, _) if a == w-1:
                return 'None'
            case(a, _) if a == w-2:
                return snake.Cell_type.BORDER.name
            case(_, 0):
                return snake.Cell_type.BORDER.name
            case(_, b) if b == h-1:
                return snake.Cell_type.BORDER.name
            case _:
                return snake.Cell_type.EMPTY.name

    def mktype(x, y):
        match(x, y):
            case(a, _) if a == 0 or a == w-1:
                return (w, h, f'{x}|{y}', snake.Cell_type.BORDER.name, snake.Direction.UP.name, borderUP(x, y), snake.Direction.LEFT.name, borderLEFT(x, y), snake.Direction.DOWN.name, borderDOWN(x, y), snake.Direction.RIGHT.name, borderRIGHT(x, y))
            case(_, b) if b == 0 or b == h-1:
                return (w, h, f'{x}|{y}', snake.Cell_type.BORDER.name, snake.Direction.UP.name, borderUP(x, y), snake.Direction.LEFT.name, borderLEFT(x, y), snake.Direction.DOWN.name, borderDOWN(x, y), snake.Direction.RIGHT.name, borderRIGHT(x, y))
            case _:
                return (w, h, f'{x}|{y}', snake.Cell_type.EMPTY.name, snake.Direction.UP.name, borderUP(x, y), snake.Direction.LEFT.name, borderLEFT(x, y), snake.Direction.DOWN.name, borderDOWN(x, y), snake.Direction.RIGHT.name, borderRIGHT(x, y))
    return [mktype(x, y) for x in range(w) for y in range(h)]


with open('features/neighbors-test-data.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile, delimiter=',', quotechar='"')
    for matrix in [mkaray(5, 5)]:
        for row in matrix:
            writer.writerow(row)

