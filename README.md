# Conway's Game of Life in Mojo

This project implements Conway's Game of Life using the Mojo programming language and leverages the Pygame library for visualization.

## Requirements

* Mojo
* Python (with Pygame installed)

## Installation

1. **Install Mojo:** Follow the instructions on the official Mojo website.
2. **Install Pygame:**  Use pip to install Pygame: `pip install pygame`

## Usage

1. **Save the code:** Save the provided Mojo code as `life.mojo`.
2. **Run the simulation:** Execute the code using the Mojo compiler: `mojo run life.mojo`

This will open a window displaying the Game of Life simulation. The simulation starts with a random grid of cells.

## Controls

* **Close Window:** Click the close button on the window to exit.
* **Escape Key/Q Key:** Press the Escape key or the 'q' key to exit the simulation.

## Features

* **Visualization:** Uses Pygame to display the grid and the evolution of cells.
* **Real-time Updates:** The grid updates in real-time, showing the changes in cell populations.
* **Performance Information:** Displays the current population, iteration number, and maximum population reached during the simulation.
* **Customizable:**  The `run_display` function allows customization of window size, colors, and pause duration between generations.


## Code Overview

The code is structured as follows:

* **`Grid` Class:**  (Imported from `gridv1.mojo`) Represents the grid of cells and handles the game logic (cell evolution).
* **`run_display` Function:**  Handles the visualization using Pygame.  It creates the window, draws the cells, and updates the display.
* **`main` Function:**  Initializes a random grid and starts the simulation by calling `run_display`.

## Example

```mojo
from gridv1 import Grid
from python import Python
import time

# ... (rest of the code)
