from gridv1 import Grid
from python import Python
import time


def run_display(
    owned grid: Grid,
    window_height: Int = 600,
    window_width: Int = 600,
    background_color: String = "black",
    cell_color: String = "green",
    pause: Float64 = 0.05,
) -> None:
    # Import the pygame Python package
    pygame = Python.import_module("pygame")

    # Initialize pygame modules
    pygame.init()
    font = pygame.font.Font(None, 36)  # You can choose a different font if available


    # Create a window and set its title
    window = pygame.display.set_mode((window_height, window_width))
    pygame.display.set_caption("Conway's Game of Life")

    cell_height = window_height / grid.rows
    cell_width = window_width / grid.cols
    border_size = 1
    cell_fill_color = pygame.Color(cell_color)
    background_fill_color = pygame.Color(background_color)

    running = True
    iteration = 0
    max_population = 0
    while running:
        # Poll for events
        event = pygame.event.poll()
        if event.type == pygame.QUIT:
            # Quit if the window is closed
            running = False
        elif event.type == pygame.KEYDOWN:
            # Also quit if the user presses <Escape> or 'q'
            if event.key == pygame.K_ESCAPE or event.key == pygame.K_q:
                running = False

        # Clear the window by painting with the background color
        window.fill(background_fill_color)

        # Draw each live cell in the grid
        current_population = 0
        for row in range(grid.rows):
            for col in range(grid.cols):
                if grid[row, col]:
                    current_population += 1
                    x = col * cell_width + border_size
                    y = row * cell_height + border_size
                    width = cell_width - border_size
                    height = cell_height - border_size
                    pygame.draw.rect(
                        window, cell_fill_color, (x, y, width, height)
                    )

        max_population = max(max_population, current_population)

        # Render text for population and iteration
        iteration_text = font.render("Iteration: {}".format(iteration), True, pygame.Color("white"))
        population_text = font.render("Population: {}".format(current_population), True, pygame.Color("white"))
        max_population_text = font.render("Max Population: {}".format(max_population), True, pygame.Color("white"))

        # Blit the text onto the screen
        window.blit(population_text, (10, 10))
        window.blit(iteration_text, (10, 50))
        window.blit(max_population_text, (10, 90))

        # Update the display
        pygame.display.flip()

        # Pause to let the user appreciate the scene
        time.sleep(pause)

        # Next generation
        grid = grid.evolve()
        iteration += 1

    # Shut down pygame cleanly
    pygame.quit()


def main():
    start = Grid.random(128, 128)
    run_display(start)


# def run_display(owned grid: Grid) -> None:
#     while True:
#         print(String(grid))
#         print()
#         if input("Enter 'q' to quit or press <Enter> to continue: ") == "q":
#             break
#         grid = grid.evolve()


# def main():
#     start = Grid.random(16, 16)
#     run_display(start)


# def main():
# glider = List(
# List(0, 1, 0, 0, 0, 0, 0, 0),
# List(0, 0, 1, 0, 0, 0, 0, 0),
# List(1, 1, 1, 0, 0, 0, 0, 0),
# List(0, 0, 0, 0, 0, 0, 0, 0),
# List(0, 0, 0, 0, 0, 0, 0, 0),
# List(0, 0, 0, 0, 0, 0, 0, 0),
# List(0, 0, 0, 0, 0, 0, 0, 0),
# List(0, 0, 0, 0, 0, 0, 0, 0),
# )
#
# start = Grid(8, 8, glider)
# print(String(start))
# print("********************************************")
#
# random = Grid.random(8, 8)
# print(String(random))
#
# for _ in range(10):
# print("********************************************")
# print(String(random.evolve()))
