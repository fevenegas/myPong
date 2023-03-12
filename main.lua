--[[
    Date:       March 12th, 2023
    Course:     GD50 2018
    Proyect:    Pong Remake

    Version:    pong-0
    "The Day-0 Update"

    -- Main Program --

    Author: Fabián E. Venegas Bustamante
    fevenegasb@gmail.com

    Originally programmed by Atari in 1972. Features two
    paddles, controlled by players, with the goal of getting
    the ball past your opponent's edge. First to 10 points wins.

    This version is built to more closely resemble the NES than
    the original Pong machines or the Atari 2600 in terms of
    resolution, though in widescreen (16:9) so it looks nicer on 
    modern systems.

    This version of the code is based on the one you can find on
    the course for Game Development from edX, link:
    https://learning.edx.org/course/course-v1:HarvardX+CS50G+Games/home
]]

-- Sets the size of the window view:
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- Runs when the game first starts up, only once; initializes the game.
function love.load ()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

-- Called after update by LÖVE2D, used to draw on the screen, updated or otherwise.
function love.draw ()
    love.graphics.printf(
        'Welcome to Pong!',     -- text to render
        0,                      -- starting X (0 since we're heading to the center)
        WINDOW_HEIGHT / 2 - 6,  -- starting Y (halfway down the screen)
        WINDOW_WIDTH,           -- number of pixels to center within (the entire screen)
        'center'                -- alignment mode (center, left or right)
    )
end