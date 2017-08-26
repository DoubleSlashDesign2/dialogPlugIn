-- ************************************************************************
--
-- Braintonik
--
-- Dialog and Widget UI sample code of how to use the CoronaLabs
-- Braintonik Dialog plugin
--
-- Show how to use the sliding menu 
--
-- You can reuse this source as you want.
-- 
-- ************************************************************************
-- ************************************************************************

-- ************************************************************************
-- Corona module inclusion
-- ************************************************************************
local composer = require( "composer" )

-- ************************************************************************
-- External plugin inclusion
-- ************************************************************************
local uiLib = require "plugin.braintonik-dialog"

-- ************************************************************************
-- scene creation
local scene = composer.newScene()

-- ************************************************************************
-- scene showing code
function scene:show( event )
 
    if ( event.phase == "will" ) then
        
        -- ************************************************************************
        -- get the real screen area
        local xScreen = display.contentCenterX - display.actualContentWidth / 2
        local wScreen = display.actualContentWidth
        local yScreen = display.contentCenterY - display.actualContentHeight / 2
        local hScreen = display.actualContentHeight
        
        -- ************************************************************************
        -- create our group
        display.remove( scene.myGroup )
        scene.myGroup = display.newGroup()
        self.view:insert( scene.myGroup )
        
        -- ************************************************************************
        -- create our background
        local rcBack = display.newRect( scene.myGroup, xScreen, yScreen, wScreen, hScreen )
        rcBack.anchorX = 0
        rcBack.anchorY = 0
        rcBack:setFillColor(0.8)

        -- ************************************************************************
        -- create the back button of the scene
        local function backButton()
            local function buttonHandler()
                composer.gotoScene( "screens.menu" ) 
            end
            local options = {
                group = scene.myGroup,
                callBack = buttonHandler,
                x = xScreen + 10,
                y = yScreen + 20,
                w = 60,
                h = 30,
                align = "center",
                shape = "rect",
                shapeBkColor = { 0,0,0,0 },
                shapeBkSelColor = { 0, 0, 0, 0.2 },
                textTable = { text = "BACK", fontSize = 12, color = { 0.2,0.2,0.2,1 } },
            }
            local backButtonInstance, error = uiLib.newUIButton( options )
            print(  error )
        end
        backButton()
        
                
        -- ************************************************************************
        --
        -- CAROUSEL CODE CREATION AND DEMO
        --
        -- ************************************************************************
    end
    
end
 
-- ************************************************************************
-- We only need to overide the show scene
scene:addEventListener( "show", scene )

 
return scene