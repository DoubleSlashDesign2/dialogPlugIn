-- ************************************************************************
--
-- Braintonik
--
-- Dialog and Widget UI sample code of how to use the CoronaLabs
-- Braintonik Dialog plugin
--
-- Show how to use the UI buttons 
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
                textTable = {
                    text = "BACK",
                    fontSize = 12,
                    color = { 0.2,0.2,0.2,1 },
                },
            }

            local backButtonInstance, error = uiLib.newUIButton( options )
            print(  error )
        end
        backButton()

        -- ************************************************************************
        --
        -- UI BUTTON CODE CREATION AND DEMO
        --
        -- ************************************************************************
           
        -- calback definition
        local function buttonCallback( id )
            print( "button id", id)
        end

        local button_1
        local function buttonOnOff()
            if button_1:isSelected() == false then
                button_1:select(true)
            else
                button_1:select(false)
            end
        end

        local yOffset = 50
        local buttonExample_1 = {

            group = scene.myGroup,
            callBack = buttonOnOff,
            id = 1,

            x = 100,
            y = yOffset,
            w = 120,
            h = 120,
            spaceBetweenIconAndText = 5,

            align = "center",

            shape = "circle",
            shapeBkColor = { 0,0,0, 0.4 },
            shapeBorder = 2,
            shapeBorderColor = { 0.4,0.4,0.4, 1 },

            shadowTable = {
                width = 8,
                gradientColor = {
                type = "gradient",
                    color1 = { 0.7, 0.7, 0.7 },
                    color2 = {0.9, 0.9, 0.9  },
                    direction = "down"
                },
            },

            iconTable = {
                icon = "power.png",        
                w = 32,
                h = 32,
                iconColor = { 0.5, 1, 0.5, 1 },
                iconSelColor = { 1, 0.5, 0.5, 1 },
            },

            textTable = {
                text = "ON",
                textSel = "OFF",
                fontSize = 14,
                fontType = native.systemFont,
                color = { 0.5, 1, 0.5, 1 },
                selectedColor = { 1, 0.5, 0.5, 1 },
                disableColor = { 0.7, 0.7, 1, 1  },
            },
        }

        local error
        button_1, error = uiLib.newUIButton( buttonExample_1 )
        print( button_1, error )

        local buttonExample_2 = {

            group = scene.myGroup,
            callBack = buttonCallback,
            id = 2,

            x = 100,
            y = yOffset + 140,
            w = 120,
            h = 40,

            align = "center",
            alignLeftRightMargin = 20,
            spaceBetweenIconAndText = 10,

            shapeBkGradientColor = {
                type = "gradient",
                color1 = { 120/255,211/255,216/255 },
                color2 = { 14/255,169/255,173/255  },
                direction = "down"
            },

            shape = "roundedRect",
            shapeCornerRadius = 20,
            shapeBorder = 2,
            shapeBorderColor = { 11/255,136/255,142/255 },
            shapeBkSelColor = { 1, 0, 0.4, 1 },
            shapeSelBorderColor = { 1,1,1, 1 },

            shadowTable = {
                width = 8,
                gradientColor = {
                    type = "gradient",
                    color1 = { 0.7, 0.7, 0.7 },
                    color2 = {0.9, 0.9, 0.9  },
                    direction = "down"
                },
            },

            textTable = {
                text = "LOGIN",
                textSel = "LOGOUT",
                fontSize = 12,
                fontType = native.systemFont,
                color = { 1,1,1,1 },
                selectedColor = { 0.9, 0.9, 1, 1 },
                disableColor = { 0.7, 0.7, 1, 1  },
            },
        }

        local button_2, error = uiLib.newUIButton( buttonExample_2 )
        print( button_1, error )

        local buttonExample_3 = {

            group = scene.myGroup,
            callBack = buttonCallback,
            id = 3,

            x = 10,
            y = yOffset + 210,
            w = 140,
            h = 40,

            align = "left",
            alignLeftRightMargin = 5,
            spaceBetweenIconAndText = 0,

            shape = "rect",
            shapeBkGradientColor = {
                type = "gradient",
                color1 = { 59/255, 45/255, 68/255, 1 },
                color2 = { 93/255, 77/255, 105/255, 1 },
                direction = "right"
            },

            shapeBkSelGradientColor= {
                type = "gradient",
                color1 = { 59/255, 45/255, 68/255, 1 },
                color2 = { 93/255, 77/255, 105/255, 1 },
                direction = "left"
            },

            shapeBorder = 2,
            shapeBorderColor = { 109/255, 91/255, 123/255, 1 },
            shapeSelBorderColor = { 1,1,1, 1 },

            textTable = {
                text = "Locate me",
                fontSize = 14,
                fontType = native.systemFont,
                color = { 1,1,1,1 },
                selectedColor = { 0.9, 0.9, 1, 1 },
                disableColor = { 0.7, 0.7, 1, 1  },
            },
            iconTable = {
                icon = "pin.png",        
                w = 24,
                h = 24,
            },
        }

        local button_3, error = uiLib.newUIButton( buttonExample_3 )
        print( button_3, error )

        local buttonExample_4 = {

            group = scene.myGroup,
            callBack = buttonCallback,
            id = 4,
            
            x = 160,
            y = yOffset + 210,
            w = 140,
            h = 40,

            align = "left",
            alignLeftRightMargin = 5,
            spaceBetweenIconAndText = 0,

            shape = "rect",
            shapeBkGradientColor = {
                type = "gradient",
                color1 = { 59/255, 45/255, 68/255, 1 },
                color2 = { 93/255, 77/255, 105/255, 1 },
                direction = "right"
            },

            shapeBkSelGradientColor= {
                type = "gradient",
                color1 = { 59/255, 45/255, 68/255, 1 },
                color2 = { 93/255, 77/255, 105/255, 1 },
                direction = "left"
            },

            shapeBorder = 2,
            shapeBorderColor = { 109/255, 91/255, 123/255, 1 },
            shapeSelBorderColor = { 1,1,1, 1 },

            textTable = {
                text = "Locate me",
                fontSize = 14,
                fontType = native.systemFont,
                color = { 1,1,1,1 },
                selectedColor = { 0.9, 0.9, 1, 1 },
                disableColor = { 0.7, 0.7, 1, 1  },
            },

            iconTable = {
                icon = "pin.png",        
                w = 24,
                h = 24,
            },

            glassTable = {
                gradientColor = {
                    type = "gradient",
                    color1 = { 27/255, 20/255, 32/255 }, -- { 1,1,1,0 }
                    color2 = { 36/255, 27/255, 44/255, 0.5 }, -- { 1,1,1,0.2 }
                    direction = "right"
                },
            },
        }

        local button_4, error = uiLib.newUIButton( buttonExample_4 )
        print( button_4, error )

        local buttonExample_5 = {

            group = scene.myGroup,
            callBack = buttonCallback,
            id = 5,
            
            x = 10,
            y = yOffset + 270,
            w = 65,
            h = 34,

            align = "left",
            alignLeftRightMargin = 10,
            spaceBetweenIconAndText = 5,

            shape = "rect",
            shapeBkGradientColor = {
                type = "gradient",
                color1 = { 0.7, 0.7, 0.7 },
                color2 = {0.9, 0.9, 0.9  },
                direction = "up"
            },
            shapeBkDisColor = {0.9, 0.9, 0.9 },

            shapeBkSelGradientColor = {
                type = "gradient",
                color1 = { 0.7, 0.7, 0.7 },
                color2 = {0.9, 0.9, 0.9  },
                direction = "up"
            },

            textTable = {
                text = "GO",
                fontSize = 14,
                fontType = native.systemFont,
                color = { 0.3,0.3,0.3 },
                disColor = { 1, 0, 0 },
            },

            iconTable = {
                icon = "power.png",        
                w = 16,
                h = 16,
                iconColor = { 0.4,1,0.4 },
                iconSelColor = { 1,0.4,0.41 },
            },

            shadowTable = {
                width = 4,
                color = { 0.4,0.4,0.4 },
                xOffset = 6,
                yOffset = 6,
                wOffset = -9,
                hOffset = -9,
            },
        }

        local button_5, error = uiLib.newUIButton( buttonExample_5 )
        button_5:disable(true)
        print( button_5, error )

        local buttonExample_6 = {

            group = scene.myGroup,
            callBack = buttonCallback,
            id = 6,
            
            x = 90,
            y = yOffset + 270,
            w = 65,
            h = 34,

            align = "left",
            alignLeftRightMargin = 10,
            spaceBetweenIconAndText = 5,

            shape = "rect",
            shapeBkGradientColor = {
                type = "gradient",
                color1 = { 0.7, 0.7, 0.7 },
                color2 = {0.9, 0.9, 0.9  },
                direction = "up"
            },

            shapeBkSelGradientColor = {
                type = "gradient",
                color1 = { 0.7, 0.7, 0.7 },
                color2 = {0.9, 0.9, 0.9  },
                direction = "up"
            },

            textTable = {
                text = "Lorem",
                fontSize = 12,
                fontType = native.systemFont,
                color = { 0.3,0.3,0.3 },
            },

            glassTable = {
                color = { 0.2,1,0.8 },
                selColor = { 0.8,0.2,0.5 },
                glassHeight = 2,
                xOffset = 4,
                yOffset = 4,
            },

        }

        local button_6, error = uiLib.newUIButton( buttonExample_6 )
        print( button_6, error )     
    end 
end
 
-- ************************************************************************
-- We only need to overide the show scene
scene:addEventListener( "show", scene )

 
return scene