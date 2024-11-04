% Facts to represent tasks in the form: task(TaskID, Description, Assignee, Status).
:- dynamic task/4.

% 1. Predicate to create tasks.
create_task(TaskID, Description, Assignee) :-
    \+ task(TaskID, _, _, _), % Ensure task with TaskID does not already exist
    assertz(task(TaskID, Description, Assignee, false)),
    format('Task ~w created.~n', [TaskID]).

% 2. Predicate to assign a task to a user.
assign_task(TaskID, NewAssignee) :-
    retract(task(TaskID, Description, _, Status)),
    assertz(task(TaskID, Description, NewAssignee, Status)),
    format('Task ~w assigned to user: ~w.~n', [TaskID, NewAssignee]).

% 3. Predicate to mark a task as completed.
mark_completed(TaskID) :-
    retract(task(TaskID, Description, Assignee, _)),
    assertz(task(TaskID, Description, Assignee, true)),
    format('Task ~w marked as completed.~n', [TaskID]).

% 4. Predicate to display all tasks.
display_tasks :-
    forall(task(TaskID, Description, Assignee, Status), (
        format('Task ~w:~n', [TaskID]),
        format('- Description: ~w~n', [Description]),
        format('- Assignee: ~w~n', [Assignee]),
        format('- Completion status: ~w~n~n', [Status])
    )).

% 5. Predicate to display tasks assigned to a specific user.
display_tasks_assigned_to(Assignee) :-
    format('Tasks assigned to ~w:~n', [Assignee]),
    forall(task(TaskID, Description, Assignee, Status), (
        format('Task ~w:~n', [TaskID]),
        format('- Description: ~w~n', [Description]),
        format('- Completion status: ~w~n~n', [Status])
    )).

% 6. Predicate to display only completed tasks.
display_completed_tasks :-
    writeln('Completed tasks:'),
    forall(task(TaskID, Description, Assignee, true), (
        format('Task ~w:~n', [TaskID]),
        format('- Description: ~w~n', [Description]),
        format('- Assignee: ~w~n', [Assignee])
    )).
?- create_task(1, 'Implement login functionality', 'Alice').
