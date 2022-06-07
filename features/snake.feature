Feature: snake

    Scenario Outline: spontaneous normal movement
        Given a field <w> by <h>
        Given a snake of body length <l> at <c> going <d>
        When a tick happens without commands
        Then the cell type <d> of <c> is HEAD
        And the cell type at <c> is TAIL
        And the cells previously in the body, if any, remain of type TAIL
        And the cell previously at the tail is of type EMPTY
        And the snake is of lenght <l>
        And the snake direction is <d>

        Examples:
            | w | h | c    | l | d     |
            | 7 | 7 | 3\|3 | 0 | UP    |
            | 7 | 7 | 3\|3 | 0 | LEFT  |
            | 7 | 7 | 3\|3 | 0 | RIGHT |
            | 7 | 7 | 3\|3 | 0 | DOWN  |
            | 7 | 7 | 3\|3 | 1 | UP    |
            | 7 | 7 | 3\|3 | 1 | LEFT  |
            | 7 | 7 | 3\|3 | 1 | DOWN  |
            | 7 | 7 | 3\|3 | 1 | RIGHT |

    Scenario Outline: spontaneous collision movement
        Given a field <w> by <h>
        Given a snake of body length <l> at <c> going <d>
        Given a cell of type <t> at <d> of <c>
        When a tick happens without commands
        Then the game ends

        Examples:
            | w | h | c    | l | d     | t      |
            | 7 | 7 | 3\|3 | 0 | UP    | BORDER |
            | 7 | 7 | 3\|3 | 0 | LEFT  | BORDER |
            | 7 | 7 | 3\|3 | 0 | RIGHT | BORDER |
            | 7 | 7 | 3\|3 | 0 | DOWN  | BORDER |
            | 7 | 7 | 3\|3 | 1 | UP    | BORDER |
            | 7 | 7 | 3\|3 | 1 | LEFT  | BORDER |
            | 7 | 7 | 3\|3 | 1 | DOWN  | BORDER |
            | 7 | 7 | 3\|3 | 1 | RIGHT | BORDER |
            | 7 | 7 | 3\|3 | 0 | UP    | TAIL   |
            | 7 | 7 | 3\|3 | 0 | LEFT  | TAIL   |
            | 7 | 7 | 3\|3 | 0 | RIGHT | TAIL   |
            | 7 | 7 | 3\|3 | 0 | DOWN  | TAIL   |
            | 7 | 7 | 3\|3 | 1 | UP    | TAIL   |
            | 7 | 7 | 3\|3 | 1 | LEFT  | TAIL   |
            | 7 | 7 | 3\|3 | 1 | DOWN  | TAIL   |
            | 7 | 7 | 3\|3 | 1 | RIGHT | TAIL   |

    Scenario Outline: spontaneous eating movement
        Given a field <w> by <h>
        Given a snake of body length <l> at <c> going <d>
        Given a cell of type EGG at <d> of <c>
        When a tick happens without commands
        Then the cell type <d> of <c> is HEAD
        And the cell type at <c> is TAIL
        And the cells previously in the body, if any, remain of type TAIL
        And the cell previously at the tail is of type TAIL
        And the snake is of lenght <l2>
        And the snake direction is <d>

        Examples:
            | w | h | c    | l | d     | l2 |
            | 7 | 7 | 3\|3 | 0 | UP    | 1  |
            | 7 | 7 | 3\|3 | 0 | LEFT  | 1  |
            | 7 | 7 | 3\|3 | 0 | RIGHT | 1  |
            | 7 | 7 | 3\|3 | 0 | DOWN  | 1  |
            | 7 | 7 | 3\|3 | 1 | UP    | 2  |
            | 7 | 7 | 3\|3 | 1 | LEFT  | 2  |
            | 7 | 7 | 3\|3 | 1 | DOWN  | 2  |
            | 7 | 7 | 3\|3 | 1 | RIGHT | 2  |

    Scenario Outline: directed normal movement
        Given a field <w> by <h>
        Given a snake of body length <l> at <c> going <od>
        When a tick happens with command to go <com>
        Then the cell type <fd> of <c> is HEAD
        And the cell type at <c> is TAIL
        And the cells previously in the body, if any, remain of type TAIL
        And the cell previously at the tail is of type EMPTY
        And the snake is of lenght <l>
        And the snake direction is <fd>

        Examples:
            | w | h | c    | l | od    | com   | fd    |
            | 7 | 7 | 3\|3 | 0 | UP    | UP    | UP    |
            | 7 | 7 | 3\|3 | 0 | UP    | LEFT  | LEFT  |
            | 7 | 7 | 3\|3 | 0 | UP    | DOWN  | UP    |
            | 7 | 7 | 3\|3 | 0 | UP    | RIGHT | RIGHT |
            | 7 | 7 | 3\|3 | 0 | LEFT  | UP    | UP    |
            | 7 | 7 | 3\|3 | 0 | LEFT  | LEFT  | LEFT  |
            | 7 | 7 | 3\|3 | 0 | LEFT  | DOWN  | DOWN  |
            | 7 | 7 | 3\|3 | 0 | LEFT  | RIGHT | LEFT  |
            | 7 | 7 | 3\|3 | 0 | DOWN  | UP    | DOWN  |
            | 7 | 7 | 3\|3 | 0 | DOWN  | LEFT  | LEFT  |
            | 7 | 7 | 3\|3 | 0 | DOWN  | DOWN  | DOWN  |
            | 7 | 7 | 3\|3 | 0 | DOWN  | RIGHT | RIGHT |
            | 7 | 7 | 3\|3 | 0 | RIGHT | UP    | UP    |
            | 7 | 7 | 3\|3 | 0 | RIGHT | LEFT  | RIGHT |
            | 7 | 7 | 3\|3 | 0 | RIGHT | DOWN  | DOWN  |
            | 7 | 7 | 3\|3 | 0 | RIGHT | RIGHT | RIGHT |
            | 7 | 7 | 3\|3 | 1 | UP    | UP    | UP    |
            | 7 | 7 | 3\|3 | 1 | UP    | LEFT  | LEFT  |
            | 7 | 7 | 3\|3 | 1 | UP    | DOWN  | UP    |
            | 7 | 7 | 3\|3 | 1 | UP    | RIGHT | RIGHT |
            | 7 | 7 | 3\|3 | 1 | LEFT  | UP    | UP    |
            | 7 | 7 | 3\|3 | 1 | LEFT  | LEFT  | LEFT  |
            | 7 | 7 | 3\|3 | 1 | LEFT  | DOWN  | DOWN  |
            | 7 | 7 | 3\|3 | 1 | LEFT  | RIGHT | LEFT  |
            | 7 | 7 | 3\|3 | 1 | DOWN  | UP    | DOWN  |
            | 7 | 7 | 3\|3 | 1 | DOWN  | LEFT  | LEFT  |
            | 7 | 7 | 3\|3 | 1 | DOWN  | DOWN  | DOWN  |
            | 7 | 7 | 3\|3 | 1 | DOWN  | RIGHT | RIGHT |
            | 7 | 7 | 3\|3 | 1 | RIGHT | UP    | UP    |
            | 7 | 7 | 3\|3 | 1 | RIGHT | LEFT  | RIGHT |
            | 7 | 7 | 3\|3 | 1 | RIGHT | DOWN  | DOWN  |
            | 7 | 7 | 3\|3 | 1 | RIGHT | RIGHT | RIGHT |

    Scenario Outline: directed collision movement
        Given a field <w> by <h>
        Given a snake of body length <l> at <c> going <od>
        Given a cell of type <t> at <fd> of <c>
        When a tick happens with command to go <com>
        Then the game ends 

        Examples:
            | w | h | c    | l | od    | com   | fd    | t |
            | 7 | 7 | 3\|3 | 0 | UP    | UP    | UP    | BORDER |
            | 7 | 7 | 3\|3 | 0 | UP    | LEFT  | LEFT  | BORDER |
            | 7 | 7 | 3\|3 | 0 | UP    | DOWN  | UP    | BORDER |
            | 7 | 7 | 3\|3 | 0 | UP    | RIGHT | RIGHT | BORDER |
            | 7 | 7 | 3\|3 | 0 | LEFT  | UP    | UP    | BORDER |
            | 7 | 7 | 3\|3 | 0 | LEFT  | LEFT  | LEFT  | BORDER |
            | 7 | 7 | 3\|3 | 0 | LEFT  | DOWN  | DOWN  | BORDER |
            | 7 | 7 | 3\|3 | 0 | LEFT  | RIGHT | LEFT  | BORDER |
            | 7 | 7 | 3\|3 | 0 | DOWN  | UP    | DOWN  | BORDER |
            | 7 | 7 | 3\|3 | 0 | DOWN  | LEFT  | LEFT  | BORDER |
            | 7 | 7 | 3\|3 | 0 | DOWN  | DOWN  | DOWN  | BORDER |
            | 7 | 7 | 3\|3 | 0 | DOWN  | RIGHT | RIGHT | BORDER |
            | 7 | 7 | 3\|3 | 0 | RIGHT | UP    | UP    | BORDER |
            | 7 | 7 | 3\|3 | 0 | RIGHT | LEFT  | RIGHT | BORDER |
            | 7 | 7 | 3\|3 | 0 | RIGHT | DOWN  | DOWN  | BORDER |
            | 7 | 7 | 3\|3 | 0 | RIGHT | RIGHT | RIGHT | BORDER |
            | 7 | 7 | 3\|3 | 1 | UP    | UP    | UP    | BORDER |
            | 7 | 7 | 3\|3 | 1 | UP    | LEFT  | LEFT  | BORDER |
            | 7 | 7 | 3\|3 | 1 | UP    | DOWN  | UP    | BORDER |
            | 7 | 7 | 3\|3 | 1 | UP    | RIGHT | RIGHT | BORDER |
            | 7 | 7 | 3\|3 | 1 | LEFT  | UP    | UP    | BORDER |
            | 7 | 7 | 3\|3 | 1 | LEFT  | LEFT  | LEFT  | BORDER |
            | 7 | 7 | 3\|3 | 1 | LEFT  | DOWN  | DOWN  | BORDER |
            | 7 | 7 | 3\|3 | 1 | LEFT  | RIGHT | LEFT  | BORDER |
            | 7 | 7 | 3\|3 | 1 | DOWN  | UP    | DOWN  | BORDER |
            | 7 | 7 | 3\|3 | 1 | DOWN  | LEFT  | LEFT  | BORDER |
            | 7 | 7 | 3\|3 | 1 | DOWN  | DOWN  | DOWN  | BORDER |
            | 7 | 7 | 3\|3 | 1 | DOWN  | RIGHT | RIGHT | BORDER |
            | 7 | 7 | 3\|3 | 1 | RIGHT | UP    | UP    | BORDER |
            | 7 | 7 | 3\|3 | 1 | RIGHT | LEFT  | RIGHT | BORDER |
            | 7 | 7 | 3\|3 | 1 | RIGHT | DOWN  | DOWN  | BORDER |
            | 7 | 7 | 3\|3 | 1 | RIGHT | RIGHT | RIGHT | TAIL |
            | 7 | 7 | 3\|3 | 0 | UP    | UP    | UP    | TAIL |
            | 7 | 7 | 3\|3 | 0 | UP    | LEFT  | LEFT  | TAIL |
            | 7 | 7 | 3\|3 | 0 | UP    | DOWN  | UP    | TAIL |
            | 7 | 7 | 3\|3 | 0 | UP    | RIGHT | RIGHT | TAIL |
            | 7 | 7 | 3\|3 | 0 | LEFT  | UP    | UP    | TAIL |
            | 7 | 7 | 3\|3 | 0 | LEFT  | LEFT  | LEFT  | TAIL |
            | 7 | 7 | 3\|3 | 0 | LEFT  | DOWN  | DOWN  | TAIL |
            | 7 | 7 | 3\|3 | 0 | LEFT  | RIGHT | LEFT  | TAIL |
            | 7 | 7 | 3\|3 | 0 | DOWN  | UP    | DOWN  | TAIL |
            | 7 | 7 | 3\|3 | 0 | DOWN  | LEFT  | LEFT  | TAIL |
            | 7 | 7 | 3\|3 | 0 | DOWN  | DOWN  | DOWN  | TAIL |
            | 7 | 7 | 3\|3 | 0 | DOWN  | RIGHT | RIGHT | TAIL |
            | 7 | 7 | 3\|3 | 0 | RIGHT | UP    | UP    | TAIL |
            | 7 | 7 | 3\|3 | 0 | RIGHT | LEFT  | RIGHT | TAIL |
            | 7 | 7 | 3\|3 | 0 | RIGHT | DOWN  | DOWN  | TAIL |
            | 7 | 7 | 3\|3 | 0 | RIGHT | RIGHT | RIGHT | TAIL |
            | 7 | 7 | 3\|3 | 1 | UP    | UP    | UP    | TAIL |
            | 7 | 7 | 3\|3 | 1 | UP    | LEFT  | LEFT  | TAIL |
            | 7 | 7 | 3\|3 | 1 | UP    | DOWN  | UP    | TAIL |
            | 7 | 7 | 3\|3 | 1 | UP    | RIGHT | RIGHT | TAIL |
            | 7 | 7 | 3\|3 | 1 | LEFT  | UP    | UP    | TAIL |
            | 7 | 7 | 3\|3 | 1 | LEFT  | LEFT  | LEFT  | TAIL |
            | 7 | 7 | 3\|3 | 1 | LEFT  | DOWN  | DOWN  | TAIL |
            | 7 | 7 | 3\|3 | 1 | LEFT  | RIGHT | LEFT  | TAIL |
            | 7 | 7 | 3\|3 | 1 | DOWN  | UP    | DOWN  | TAIL |
            | 7 | 7 | 3\|3 | 1 | DOWN  | LEFT  | LEFT  | TAIL |
            | 7 | 7 | 3\|3 | 1 | DOWN  | DOWN  | DOWN  | TAIL |
            | 7 | 7 | 3\|3 | 1 | DOWN  | RIGHT | RIGHT | TAIL |
            | 7 | 7 | 3\|3 | 1 | RIGHT | UP    | UP    | TAIL |
            | 7 | 7 | 3\|3 | 1 | RIGHT | LEFT  | RIGHT | TAIL |
            | 7 | 7 | 3\|3 | 1 | RIGHT | DOWN  | DOWN  | TAIL |
            | 7 | 7 | 3\|3 | 1 | RIGHT | RIGHT | RIGHT | TAIL |

    Scenario Outline: directed eating movement
        Given a field <w> by <h>
        Given a snake of body length <l> at <c> going <od>
        Given a cell of type EGG at <fd> of <c>
        When a tick happens with command to go <com>
        Then the cell type <fd> of <c> is HEAD
        And the cell type at <c> is TAIL
        And the cells previously in the body, if any, remain of type TAIL
        And the cell previously at the tail is of type TAIL
        And the snake is of lenght <l2>
        And the snake direction is <fd>

        Examples:
            | w | h | c    | l | od    | com   | fd    | l2 |
            | 7 | 7 | 3\|3 | 0 | UP    | UP    | UP    | 1 |
            | 7 | 7 | 3\|3 | 0 | UP    | LEFT  | LEFT  | 1 |
            | 7 | 7 | 3\|3 | 0 | UP    | DOWN  | UP    | 1 |
            | 7 | 7 | 3\|3 | 0 | UP    | RIGHT | RIGHT | 1 |
            | 7 | 7 | 3\|3 | 0 | LEFT  | UP    | UP    | 1 |
            | 7 | 7 | 3\|3 | 0 | LEFT  | LEFT  | LEFT  | 1 |
            | 7 | 7 | 3\|3 | 0 | LEFT  | DOWN  | DOWN  | 1 |
            | 7 | 7 | 3\|3 | 0 | LEFT  | RIGHT | LEFT  | 1 |
            | 7 | 7 | 3\|3 | 0 | DOWN  | UP    | DOWN  | 1 |
            | 7 | 7 | 3\|3 | 0 | DOWN  | LEFT  | LEFT  | 1 |
            | 7 | 7 | 3\|3 | 0 | DOWN  | DOWN  | DOWN  | 1 |
            | 7 | 7 | 3\|3 | 0 | DOWN  | RIGHT | RIGHT | 1 |
            | 7 | 7 | 3\|3 | 0 | RIGHT | UP    | UP    | 1 |
            | 7 | 7 | 3\|3 | 0 | RIGHT | LEFT  | RIGHT | 1 |
            | 7 | 7 | 3\|3 | 0 | RIGHT | DOWN  | DOWN  | 1 |
            | 7 | 7 | 3\|3 | 0 | RIGHT | RIGHT | RIGHT | 1 |
            | 7 | 7 | 3\|3 | 1 | UP    | UP    | UP    | 2 |
            | 7 | 7 | 3\|3 | 1 | UP    | LEFT  | LEFT  | 2 |
            | 7 | 7 | 3\|3 | 1 | UP    | DOWN  | UP    | 2 |
            | 7 | 7 | 3\|3 | 1 | UP    | RIGHT | RIGHT | 2 | 
            | 7 | 7 | 3\|3 | 1 | LEFT  | UP    | UP    | 2 |
            | 7 | 7 | 3\|3 | 1 | LEFT  | LEFT  | LEFT  | 2 | 
            | 7 | 7 | 3\|3 | 1 | LEFT  | DOWN  | DOWN  | 2 |
            | 7 | 7 | 3\|3 | 1 | LEFT  | RIGHT | LEFT  | 2 |
            | 7 | 7 | 3\|3 | 1 | DOWN  | UP    | DOWN  | 2 |
            | 7 | 7 | 3\|3 | 1 | DOWN  | LEFT  | LEFT  | 2 |
            | 7 | 7 | 3\|3 | 1 | DOWN  | DOWN  | DOWN  | 2 |
            | 7 | 7 | 3\|3 | 1 | DOWN  | RIGHT | RIGHT | 2 |
            | 7 | 7 | 3\|3 | 1 | RIGHT | UP    | UP    | 2 |
            | 7 | 7 | 3\|3 | 1 | RIGHT | LEFT  | RIGHT | 2 |
            | 7 | 7 | 3\|3 | 1 | RIGHT | DOWN  | DOWN  | 2 |
            | 7 | 7 | 3\|3 | 1 | RIGHT | RIGHT | RIGHT | 2 |