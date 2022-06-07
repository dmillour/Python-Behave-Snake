from behave import *
import snake


@given('a field {width:d} by {height:d}')
def impl_field(context, width, height):
    context.field = snake.Field(width, height)


@given('a snake of body length {length:d} at {coordinate:Coordinate} going {direction:Direction}')
def impl_snake(context, length, coordinate, direction):
    context.snake = snake.Snake(
        context.field.get(*coordinate), length, direction)


@given('a cell of type {type:Cell_type} at {direction:Direction} of {coordinate:Coordinate}')
def impl_cell(context, type, coordinate, direction):
    cell = context.field.get(*coordinate).neighbor(direction)
    assert cell is not None
    cell.type = type


@when('you pick a cell at coordinates {coordinate:Coordinate}')
def pick_cell(context, coordinate):
    context.cell = context.field.get(*coordinate)
    assert context.cell is not None


@when('a tick happens without commands')
def pick_cell(context):
    #save the previous head, body and tail
    context.previous_head = context.snake.head
    context.previous_body = context.snake.body.copy()
    context.previous_tail = context.snake.tail
    try:
        context.snake.tick()
    except snake.YouLost as err:
        context.exception = err


@when('a tick happens with command to go {direction:Direction}')
def pick_cell(context, direction):
    #save the previous head, body and tail
    context.previous_head = context.snake.head
    context.previous_body = context.snake.body.copy()
    context.previous_tail = context.snake.tail
    try:
        context.snake.tick(direction)
    except snake.YouLost as err:
        context.exception = err


@then('the cell type at {coordinate:Coordinate} is {type:Cell_type}')
def check_cell_type(context, coordinate, type):
    cell = context.field.get(*coordinate)
    assert cell.type == type


@then('the cell type {direction:Direction} of {coordinate:Coordinate} is {type:Cell_type}')
def check_neighbor(context, direction, coordinate, type):
    cell = context.field.get(*coordinate).neighbor(direction)
    if(type is None):
        assert cell is None
    else:
        assert not cell is None
        assert cell.type == type


@then('the cells previously in the body, if any, remain of type TAIL')
def check_body(context):
    assert not list(filter(lambda c: c.type != snake.Cell_type.TAIL, context.previous_body ))


@then('the cell previously at the tail is of type {type:Cell_type}')
def check_tail(context, type):
    assert context.previous_tail.type == type 


@then('the snake is of lenght {length:d}')
def check_length(context, length):
    assert len(context.snake.body) == length


@then('the snake direction is {direction:Direction}')
def check_direction(context, direction):
    assert context.snake.direction == direction


@then('the game ends')
def check_ends(context):
    assert hasattr(context, 'exception')
    assert isinstance(context.exception, snake.YouLost)
