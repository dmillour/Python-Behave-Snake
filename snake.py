import collections
from enum import Enum


class Cell_type(Enum):
    EMPTY = 0
    BORDER = 1
    HEAD = 2
    TAIL = 3
    EGG = 4


class Direction(Enum):
    UP = 0
    LEFT = 1
    DOWN = 2
    RIGHT = 3

    def opposit(self):
        return {Direction.UP: Direction.DOWN,
                Direction.LEFT: Direction.RIGHT,
                Direction.DOWN: Direction.UP,
                Direction.RIGHT: Direction.LEFT}[self]


class YouLost(Exception):
    pass


class Cell():

    def __init__(self, type) -> None:
        self.type = type
        self.neighbors = {}

    def neighbor(self, direction):
        if(direction in self.neighbors):
            return self.neighbors[direction]
        else:
            return None

    def connect(self, cell, direction):
        if not cell is None:
            self.neighbors[direction] = cell
            cell.neighbors[direction.opposit()] = self


class Field():

    def __init__(self, w, h) -> None:
        self.w = w
        self.h = h

        def mkcell(x, y):
            if(x == 0 or x == w-1 or y == 0 or y == h-1):
                return Cell(Cell_type.BORDER)
            else:
                return Cell(Cell_type.EMPTY)
        self.matrix = [[mkcell(x, y) for y in range(h)] for x in range(w)]
        for x in range(w):
            for y in range(h):
                self.get(x, y).connect(self.get(x+1, y), Direction.RIGHT)
                self.get(x, y).connect(self.get(x, y+1), Direction.DOWN)

    def get(self, x, y):
        if(0 <= x < self.w and 0 <= y < self.h):
            return self.matrix[x][y]
        else:
            return None


class Snake():

    def __init__(self, head, lenght, direction) -> None:
        self.direction = direction
        # head
        self.head = head
        head.type = Cell_type.HEAD
        # body
        self.body = collections.deque()
        cell = head
        for i in range(lenght):
            cell = cell.neighbor(direction.opposit())
            self.body.append(cell)
            cell.type = Cell_type.TAIL
        # tail
        self.tail = cell.neighbor(direction.opposit())
        self.tail.type = Cell_type.TAIL

    def tick(self, direction=None):
        # obey the command if posible
        if(direction is None or direction == self.direction.opposit()):
            direction = self.direction
        new_head = self.head.neighbor(direction)
        self.direction = direction
        assert not new_head is None
        # lose if collision
        if(new_head.type == Cell_type.BORDER or new_head.type == Cell_type.TAIL):
            raise YouLost(f'You lost, score: {len(self.body)}')
        # put the head in the body
        self.head.type = Cell_type.TAIL
        self.body.appendleft(self.head)
        # cut the tail if not eating
        if(new_head.type == Cell_type.EMPTY):
            self.tail.type = Cell_type.EMPTY
            self.tail = self.body.pop()
        # move the new head
        self.head = new_head
        self.head.type = Cell_type.HEAD
