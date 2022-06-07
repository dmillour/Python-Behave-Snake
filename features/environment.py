from csv import reader
import re
from behave import register_type
import snake


def parse_coordinate(text):
    result = re.search(r'(\d+)\|(\d+)', text)
    return (int(result.group(1)), int(result.group(2)))


register_type(Coordinate=parse_coordinate)


def parse_field_type(text):
    if text == 'None':
        return None
    else:
        return snake.Cell_type[text]


register_type(Cell_type=parse_field_type)


def parse_direction(text):
    if text == 'None':
        return None
    else:
        return snake.Direction[text]


register_type(Direction=parse_direction)


def before_feature(context, feature):

    if feature.name == 'topology':
        path_to_file = 'features/neighbors-test-data.csv'
        # >>> find the first examples object for scenario with given name
        example = next(sc.examples[0]
                       for sc in feature.scenarios if sc.name == 'neighbors')
        import csv
        with open(path_to_file, newline='') as csvfile:
            reader = csv.reader(csvfile)
            for row in reader:
                example.table.add_row(row)
