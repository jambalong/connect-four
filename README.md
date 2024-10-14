# Connect-Four Game

This project is part of The Odin Project: [Connect Four](https://www.theodinproject.com/lessons/ruby-connect-four) in Ruby curriculum.

## Description

Connect Four is a two-player board game in which Players take turns dropping colored tokens in a 6x7 grid. Tokens fall straight down, occupying the lowest open space in the column. The first to complete a horizontal, vertical, or diagonal line of four of their own token wins the game.

## Live Demo

You can play the Connect-Four game online by accessing the following link:
[Play Connect-Four on Replit](https://replit.com/@jambalong/connect-four)

## Assignment

Build the Connect Four project in a Test-Driven Development.

## Features

- **Game Setup**: Initialize a new game with a defined grid size (typically 7 columns x 6 rows).
- **Player Turns**: Alternate between two players, allowing them to drop their pieces into columns.
- **Winning Conditions**: Check for a win condition after each move, including:
  - Four in a row (horizontal)
  - Four in a column (vertical)
  - Four in a diagonal (both ascending and descending)
- **Draw Condition**: Determine if the game ends in a draw when all columns are filled without a winner.
- **Display Board**: Print the game board in a user-friendly format after each turn.
- **Input Validation**: Ensure player inputs are valid (e.g., within bounds, not choosing a filled column).

## Lessons Learned

- **Test-Driven Development (TDD)**: 
  - Understanding the cycle of writing a test, implementing the functionality, and then refactoring helped reinforce the importance of code quality and test coverage.
  - Recognizing that writing tests first can lead to clearer code design and more intentional feature development.

- **Design Principles**:
  - Learning to break down features into smaller, testable components encouraged a modular approach to coding.
  - Implementing OOP principles (like encapsulation) in designing the game classes (e.g., Board, Player) made the codebase cleaner and easier to maintain.

- **Debugging Skills**: 
  - Writing tests before code improved debugging efficiency, as you could pinpoint issues more easily when tests failed.
  - Learning to use debugging tools and techniques, such as `puts` statements or the debugger, to track down logical errors.

## Installation

1. **Prerequisites:**
   - Ruby installed on your machine.
   - You can use Bundler to install dependencies

2. **Clone the Repository:**
   ```bash
   git clone https://github.com/jambalong/connect-four.git
   cd connect-four
   ```

3. **Install Dependencies:**
   ```bash
   bundle install
   ```

3. **Run the Game:**
   ```bash
   bundle exec ruby main.rb
   ```

4. **Run Tests:**
   ```bash
   rspec
   ```
