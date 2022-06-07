Feature: topology

    Scenario Outline: neighbors
        Given a field <w> by <h>
        When you pick a cell at coordinates <c>
        Then the cell type at <c> is <type>
        And the cell type <d1> of <c> is <t1>
        And the cell type <d2> of <c> is <t2>
        And the cell type <d3> of <c> is <t3>
        And the cell type <d4> of <c> is <t4>

        Examples:
            | w | h | c | type | d1 | t1 | d2 | t2 | d3 | t3 | d4 | t4 |

    Scenario Outline: snake presence
        Given a field <w> by <h>
        Given a snake of body length <l> at <head> going <d>
        When you pick a cell at coordinates <c>
        Then the cell type at <c> is <t>
        And the snake is of lenght <l>
        And the snake direction is <d>
        Examples:
            | w | h | head | d  | l | c    | t     |
            | 7 | 7 | 3\|3 | UP | 0 | 3\|3 | HEAD  |
            | 7 | 7 | 3\|3 | UP | 0 | 3\|4 | TAIL  |
            | 7 | 7 | 3\|3 | UP | 0 | 3\|5 | EMPTY |
            | 7 | 7 | 3\|3 | UP | 1 | 3\|4 | TAIL  |
            | 7 | 7 | 3\|3 | UP | 1 | 3\|5 | TAIL  |
