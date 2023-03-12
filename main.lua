--[[
    Date:       March 12th, 2023
    Course:     GD50 2018
    Proyect:    Pong Remake

    Version:    pong-2
    "Paddles & font"

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

-- push is a library that will allow us to draw our game at a virtual
-- resolution, instead of however large our window is; used to provide
-- a more retro aesthetic
--
-- https://github.com/Ulydev/push
push = require 'push'

-- Sets the size of the window view:
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

-- Runs when the game first starts up, only once; initializes the game.
function love.load ()
    -- use nearest-neighbor filtering on upscaling and downscaling to prevent blurring of text 
    -- and graphics; try removing this function to see the difference!
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- more "retro-looking" font object we can use for any text. Each size or variant must be
    -- defined/initialized as a different variable.
    smallFont = love.graphics.newFont('font.ttf', 8)

    -- set LÖVE2D's active font to the smallFont obect
    love.graphics.setFont(smallFont)

    -- initialize virtual resolution, it will be render within the actual window no matter its
    -- dimensions; replaces the love.window.setMode call from the previous version.
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

-- Keyboard handling, called by LÖVE2D each frame; passes in the key pressed for access.
function love.keypressed (key)
    -- 'key' can be accessed by its string name
    if key == 'escape' then
        -- function LÖVE gives to terminate application
        love.event.quit()
    end
end

-- Called after update by LÖVE2D, used to draw on the screen, updated or otherwise.
function love.draw ()
    -- begin rendering at virtual resolution
    push:apply('start')

    -- clear the screen with a specific color; in this case, a color similar
    -- to some versions of the original Pong
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    -- condense versione (one line) from the last version, but now using the virtual resolution
    love.graphics.printf('Welcom to Pong!', 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')

    -- paddles are simply rectangles we draw on the screen at certain points, as is the ball

    -- render first paddle (left side)
    love.graphics.rectangle('fill', 10, 30, 5, 20)

    -- render second paddle (right side)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5, 20)

    -- render ball (center)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    -- end rendering at virtual resolution
    push:apply('end')
end