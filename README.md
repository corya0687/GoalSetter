# GoalSetter
Story-

A user creates goals which contain all smart metrics.
then user saves goals
A user can then invite other users to view also share a goal
an

Each Goal has a plan


Objects -> User,Goal,Plan

Relationships-
  A User has many goals
  A User has many plans through goals
  A goal has many users
  A goal can have many plans
  A plan belongs to a goal


Schema
User-
  Username
  email
  password

Goal
  Description
  Deadline

Plan
  Description
  completed by

Users_goals
user_id
goal_id





Tasks/Future Features:
Invitees(user) can also edit.
Inviters must approve of edits.
Coaches can view goals and add comments and tips on goals
Invitees can leave goal
Invitors can delete.
A user can login and out securely.
