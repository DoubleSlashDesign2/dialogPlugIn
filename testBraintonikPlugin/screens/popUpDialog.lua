-- ************************************************************************
--
-- Braintonik
--
-- Dialog and Widget UI sample code of how to use the CoronaLabs
-- Braintonik Dialog plugin
--
-- Show how to use the pop up dialog 
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
        local bkImgObj = display.newImage( scene.myGroup, "assets/bkImg.jpg" )
        bkImgObj.x = display.contentWidth * 0.5
        bkImgObj.y = display.contentHeight * 0.5
        local scale = math.max( wScreen / bkImgObj.width, hScreen / bkImgObj.height )
        bkImgObj:scale( scale, scale )       
                
        -- ************************************************************************
        --
        -- CAROUSEL CODE CREATION AND DEMO
        --
        -- ************************************************************************
        
        
        local function onPopUpButton()
            composer.gotoScene( "screens.menu" ) 
        end
        
        -- ************************************************************************
        -- popup dialog table definition
        -- ************************************************************************
        
        local popUpTable = { 
            strokeWidth = 3,
            strokeColor = {0,0,0,1},
            bkGradient = {
                type = "gradient",
                color1 = { 69/255, 104/255, 220/255  },
                color2 = { 176/255, 106/255, 179/255  },
                direction = "down"
            },
            paddingLeftRight = 10,
            cornerRadius = 8,

            overideBkEffect = "b&w", -- "blur is also available"

            shadowColor = {0,0,0,0.3 },
            shadowSize = 5,

            titleString = "Quiz",
            titleFont = native.systemFontBold, 
            titleFontSize = 22, 
            titleVerticalAlignment = "center",
            titleColor = { 1,1,1 },
            titleMinHeight = 50,
            titleHorizontalAlignment = "Middle",

            textString = "Which planet is closest to the sun ?",-- you want to delete this album ?
            textFont = native.systemFont,
            textFontSize = 18,
            textVerticalAlignment = "center", 
            textHorizontalAlignment = "Top", 
            textColor = { 1,1,1 },

            buttonOrientation = "vertical",
            buttonFont = native.systemFont, 
            buttonFontSize = 18,
            buttonLabelColor = { default = { 126/255, 131/255, 171/255 }, press = { 0,0,0,1 } },
            buttonColor = { default = {1,1,1,1}, press = { 1,1,1 } },
            buttonWidth = 140, 
            buttonHeight = 36,
            buttonAlignment = "center", 
            buttonCornerRadius = 4,
            buttonHandler = onPopUpButton,
            buttonName = { "Earth", "Mercury", "Jupiter" }, 

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
        
        -- ************************************************************************
        -- create a popup from template
        
        -- predefine template : "roundClassicGrey", "rectGreyBlue", "roundWhiteBlue", "roundWhiteBusiness" }
        local options = uiLib.applyOptionsFromTemplate( "roundClassicGrey" )

        -- we want a predefined animation
        uiLib.addTransition( options, "RightToLeft" )

        -- we want to block all touch events
        uiLib.addBackgroundOptions( options, true )

        -- define our button callback handler
        local function callBack( pressedButton )
            local error = uiLib.displayPopupDialog( popUpTable )
            print( error )
        end

        -- set our different data
        options.titleString = "Dialog Title"
        options.textString = "This is an example of what can be done with Braintonik dialog Popup plugin!"
        options.buttonHandler = callBack
        options.buttonName = { "NEXT" } 

        -- we want to overide the default screen
        options.xScreen = xScreen
        options.yScreen = yScreen
        options.wScreen = wScreen
        options.hScreen = hScreen
        
        local error = uiLib.displayPopupDialog( options )
        print( error )
    end
end
 
-- ************************************************************************
-- We only need to overide the show scene
scene:addEventListener( "show", scene )

 
return scene