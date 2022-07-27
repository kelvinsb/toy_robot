## Description

- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5x5.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

# Dependencies

- Ruby > 2.7

# Run api local

1. `bundle install`
2. `ruby api.rb`

# Run tests

1. `bundle install`
2. `rspec`

# To run local as cli

`ruby app/presentation/cli.rb`

The commands are below

`exit` to quit

# Behavior

- `PLACE` -> only used on first time, next occurrence will be ignored
- `MOVE` -> will be used on consecutive steps, the robot will not move when on facing edge
- `LEFT` -> robot facing will change to his left. Ex: when facing `EAST` it will change to `NORTH`
- `RIGHT` -> robot facing will change to his right. Ex: when facing `EAST` it will change to `SOUTH`
- `REPORT` -> report the current position and facing

# Commands(cli)

## PLACE X,Y,F

Initial command, to place the robot on a position

- X -> x coordinate
- Y -> y coordinate
- F -> facing side(NORTH, EAST, SOUTH, WEST)

## MOVE

Move the robot to current robot facing side.
Ex: if the robot is facing south, it will move south

## LEFT

Robot will face the left side(90 degrees)

## RIGHT

Robot will face the right side(90 degrees)

## REPORT

Report the current x and y coordinate and facing side

# Routes

## `POST` `/`

### PLACE

```JSON
{
	"command": "PLACE",
	"arguments": "1,2,EAST"
}
```

### REPORT

```JSON
{
	"command": "REPORT",
	"id": "GAME_ID_HERE"
}
```

### MOVE

```JSON
{
	"command": "MOVE",
	"id": "GAME_ID_HERE"
}
```

### LEFT

```JSON
{
	"command": "LEFT",
	"id": "GAME_ID_HERE"
}
```

### RIGHT

```JSON
{
	"command": "RIGHT",
	"id": "GAME_ID_HERE"
}
```

## Default return

```JSON
{
	"game_id": "GAME_ID_HERE",
	"position_x": "3",
	"position_y": "3",
	"facing": "SOUTH"
}
```

# Technical questions

## Why not using OOP principles as encapsulation?

The usecase(here as command) principle(from clean architecture) with dependency inversion principle is used here to take the SRP(Single Responsibility Principle) to a more modular way

## Why use `NORTH` on some parts and `TOP` on another?

This was to simulate the database part, sometimes we want to use on API an command different that was database.

## Why so many return on the beginning of methods?

This is an `early return` pattern(or `guard clause`), to prevent multiple `if` and `else` nested to improve code readability and enforce the correct type.
