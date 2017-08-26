-- ************************************************************************
--
-- Braintonik
--
-- Dialog and Widget UI sample code of how to use the CoronaLabs
-- Braintonik Dialog plugin
--
-- Show how to use the informative dialog 
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
        rcBack:setFillColor(0.2)

                
        -- ************************************************************************
        --
        -- INFO DIALOG CODE CREATION AND DEMO
        --
        -- ************************************************************************

        local onClickButton
        local function onDialogButtoHandler()
            onClickButton()
        end
        scene.buttonExample = 0
        
        
        -- ************************************************************************
        -- Informative dialog table definition
        -- ************************************************************************
        local infoDialogTable = {
                
            { -- template button 1
                group = scene.myGroup,
                buttonHandler = onDialogButtoHandler,
                strokeWidth = 4,
                strokeColor = {0,0,0,1},
                bkGradient = {
                    type = "gradient",
                    color1 = { 31/255, 245/255, 149/255  },
                    color2 = { 47/255, 168/255, 153/255  },
                    direction = "down",
                },
                bkDiagonalGradient = true,
                paddingLeftRight = 20,
                cornerRadius = 6,
                hDialog = 220,

                overideBkEffect = true,
                shadowColor = {0,0,0,0.3 },
                shadowSize = 5,

                iconFileName = "assets/Transport-Van.png",
                iconFileNameBaseDir = system.ResourceDirectory,
                iconWidth = 96,
                iconHeight = 68,
                iconColor = { 47/255, 168/255, 153/255 },
                iconInCircle = true,
                iconOnTop = true,

                titleString = "ORDER PLACED", 
                titleFont = native.systemFontBold, 
                titleFontSize = 18, 
                titleColor = { 1,1,1,1},

                textString = "Your order has been placed and will be delivered in 2 weeks.",
                textFont = native.systemFont,
                textFontSize = 16,
                textColor = { 1,1,1, 0.7 },

                buttonFont = native.systemFontBold, 
                buttonFontSize = 16,
                buttonLabelColor = { default = { 47/255, 168/255, 153/255 }, press = { 1,1,1 } },
                buttonColor = { default = {1,1,1,1}, press = { 47/255, 168/255, 153/255 } },
                buttonHeight = 60,
                buttonName = "COOL", 

                transitionIn = "bottom",
                timeIn = 1000,
                easingIn = easing.outExpo,
                transitionOut = "bottom",
                easingOut = easing.outExpo,
                timeOut = 1000,

                xScreen = xScreen,
                yScreen = yScreen,
                wScreen = wScreen,
                hScreen = hScreen,
            },
            { -- template button 2
                group = scene.myGroup,
                buttonHandler = onDialogButtoHandler,
                strokeWidth = 4,
                strokeColor = {0,0,0,1},
                bkGradient = {
                    type = "gradient",
                    color1 = { 31/255, 245/255, 149/255  },
                    color2 = { 47/255, 168/255, 153/255  },
                    direction = "down",
                },
                bkDiagonalGradient = true,
                paddingLeftRight = 20,
                cornerRadius = 6,
                hDialog = 260,

                overideBkEffect = true,
                shadowColor = {0,0,0,0.3 },
                shadowSize = 5,

                iconFileName = "assets/Transport-Van.png",
                iconFileNameBaseDir = system.ResourceDirectory,
                iconWidth = 96,
                iconHeight = 68,
                iconColor = { 47/255, 168/255, 153/255 },
                iconInCircle = true,

                titleString = "ORDER PLACED", 
                titleFont = native.systemFontBold, 
                titleFontSize = 18, 
                titleColor = { 1,1,1,1},

                textString = "Your order has been placed and will be delivered in 2 weeks.",
                textFont = native.systemFont,
                textFontSize = 16,
                textColor = { 1,1,1, 0.7 },

                buttonFont = native.systemFontBold, 
                buttonFontSize = 16,
                buttonLabelColor = { default = { 47/255, 168/255, 153/255 }, press = { 1,1,1 } },
                buttonColor = { default = {1,1,1,1}, press = { 47/255, 168/255, 153/255 } },
                buttonHeight = 60,
                buttonName = "COOL", 

                transitionIn = "bottom",
                timeIn = 1000,
                easingIn = easing.outExpo,
                transitionOut = "bottom",
                easingOut = easing.outExpo,
                timeOut = 1000,

                xScreen = xScreen,
                yScreen = yScreen,
                wScreen = wScreen,
                hScreen = hScreen,
            },
            { -- template button 3
                group = scene.myGroup,
                buttonHandler = onDialogButtoHandler,
                strokeWidth = 4,
                strokeColor = {0,0,0,1},
                bkColor = { 227/255, 49/255, 35/255 },
                bkDiagonalGradient = true,
                paddingLeftRight = 20,
                cornerRadius = 6,
                hDialog = 280,

                overideBkEffect = true,
                shadowColor = {0,0,0,0.3 },
                shadowSize = 5,

                iconFileName = "assets/happy.png",
                iconFileNameBaseDir = system.ResourceDirectory,
                iconWidth = 64,
                iconHeight = 64,
                iconColor = { 1,1,1 },
                iconInCircle = nil,

                titleString = "Welcome to talk", 
                titleFont = native.systemFontBold, 
                titleFontSize = 18, 
                titleColor = { 1,1,1,1 },

                textString = "Send friends photos, videos, locations, songs, voice messages and more.",
                textFont = native.systemFont,
                textFontSize = 16,
                textColor = { 1,1,1, 0.7 },

                buttonFont = native.systemFontBold, 
                buttonFontSize = 16,
                buttonLabelColor = { default = { 1,1,1 }, press = { 1,1,1 } },
                buttonColor = { default = {211/255, 45/255, 33/255}, press = { 164/255, 35/255, 26/255 } },
                buttonHeight = 60,
                buttonName = "Let's get started", 

                transitionIn = "bottom",
                timeIn = 1000,
                easingIn = easing.outExpo,
                transitionOut = "bottom",
                easingOut = easing.outExpo,
                timeOut = 1000,

                xScreen = xScreen,
                yScreen = yScreen,
                wScreen = wScreen,
                hScreen = hScreen,
            }
        }    

        -- display 3 info dialog then quit
        onClickButton = function()
            scene.buttonExample = scene.buttonExample + 1
            if scene.buttonExample > #infoDialogTable then
                composer.gotoScene( "screens.menu" ) 
            else
                local error = uiLib.displayInfoDialog( infoDialogTable[scene.buttonExample] )
                print( error )
            end
        end
        
        onClickButton()
    end
end
 
-- ************************************************************************
-- We only need to overide the show scene
scene:addEventListener( "show", scene )

 
return scene