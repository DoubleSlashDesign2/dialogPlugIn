-- ************************************************************************
--
-- Braintonik
--
-- Dialog and Widget UI sample code of how to use the CoronaLabs
-- Braintonik Dialog plugin
--
-- Menu selector to access the demo of all UI components
--
-- You can reuse this source as you want.
-- 
-- ************************************************************************
-- ************************************************************************

-- ************************************************************************
-- Corona module inclusion
local composer = require( "composer" )

-- ************************************************************************
-- External plugin inclusion
local uiLib = require "plugin.braintonik-dialog"

-- ************************************************************************
-- scene creation
local scene = composer.newScene()
function scene:create( event )
    
    scene.menuExample = 0
    
    -- ************************************************************************
    -- get the real screen area
    local xScreen = display.contentCenterX - display.actualContentWidth / 2
    local wScreen = display.actualContentWidth
    local yScreen = display.contentCenterY - display.actualContentHeight / 2
    local hScreen = display.actualContentHeight
    
    -- ************************************************************************
    -- create our display group
    local group = display.newGroup()
    self.view:insert( group )

    -- ************************************************************************
    -- create our background
    local bkColor = display.newRect( group, xScreen, yScreen, wScreen, hScreen )
    bkColor.anchorX = 0
    bkColor.anchorY = 0
    bkColor:setFillColor( 0.8 )
     
    -- ************************************************************************
    -- create our buttons
    -- ************************************************************************
    local buttonNameTable = { 
        ["Popup Dialog"] = "screens.popUpDialog", ["Info Dialog"] = "screens.infoDialog", ["Calendar"] = "screens.calendar", ["Sliding Menu"] = "exceptionCase",
        ["Carousel"] = "screens.carousel", ["Buttons"] = "screens.uiButton" }
     
    -- ************************************************************************
    -- Create a button
    local function createUIButton( parentGroup, name, x, y, w, h )
        
        local function buttonCallback( buttonName )
            if buttonName == "Sliding Menu" then
                scene:showSlidingMenu()
            else
                composer.gotoScene( buttonNameTable[buttonName] )
            end
        end
        
        local options = {
            id = name,
            group = parentGroup,
            callBack = buttonCallback,
            x = x,
            y = y,
            w = w,
            h = h,
            align = "center",
            alignLeftRightMargin = 20,
            spaceBetweenIconAndText = 10,
            shapeBkGradientColor = {
                type = "gradient",
                color1 = { 0.8, 0.8, 0.8 },
                color2 = { 0.9, 0.9, 0.9 },
                direction = "up"
            },
            shape = "roundedRect",
            shapeCornerRadius = 22,
            shapeBorder = 2,
            shapeBorderColor = { 0.7, 0.7, 0.7 },
            shapeBkSelColor = { 38/255, 160/255, 218/255, 1 },
            shapeSelBorderColor = { 1,1,1, 1 },
            shadowTable = {
                width = 6,
                gradientColor = {
                    type = "gradient",
                    color1 = { 0.7, 0.7, 0.7 },
                    color2 = {0.9, 0.9, 0.9  },
                    direction = "down"
                },
            },
            textTable = {
                text = name,
                fontSize = 12,
                fontType = native.systemFont,
                color = { 0.3, 0.3, 0.3 },
                selectedColor = { 0.9, 0.9, 1, 1 },
            },
        }

        local buttonObj, error = uiLib.newUIButton( options )
        print( error )
    end
    
    -- ************************************************************************
    -- Create all demo buttons
    local wButton = 140
    local xButton = xScreen + wScreen / 2 - wButton / 2
    local yButton = yScreen + 40
    local hButton = 44
    for key, value in pairs(buttonNameTable) do
        createUIButton( group, key, xButton, yButton, wButton, hButton )
        yButton = yButton + hButton + 10
    end



-- ************************************************************************
--
-- Display the sliding menu
--
-- ************************************************************************
function scene:showSlidingMenu()
    
    local function callBack( itemId )
        print( "Pressed item : ", itemId )
    end
    
       
    local slidingMenuTable = {
        { -- sliding menu template 1
            appearsFrom = "left",
            wDialog = 80,
            overideBkColor = { 0,0,0, 0.2 },
            bkColor = {0,0,0,0.7},
            buttonHandler = callBack,

            itemListHeight = 70,
            itemListTextMarginPadding = 52,
            itemListIconMarginPadding = 10,

            itemListJustify = "center",
            itemListcenterSpacing = 5,
            itemListFont = native.systemFont,
            itemListFontSize = 10,

            itemList = { { name="", height = 20, fontSize = 16, height = 40 },
                         { iconFilename="assets/Basket-WF.png", iconWidth = 32, iconHeight = 32, name="Cart" },
                         { iconFilename="assets/Cloud-WF.png", iconWidth = 32, iconHeight = 32, name="Cloud Access" },
                         { iconFilename="assets/Mail1-WF.png", iconWidth = 32, iconHeight = 32, name="Email Us" },
                         { iconFilename="assets/MS Config Manage-01-WF.png", iconWidth = 32, iconHeight = 32, name="Settings" },
                         { iconFilename="assets/Rating - 01.png", iconWidth = 32, iconHeight = 32, name="Rate Us" },
                         { iconFilename="assets/Help.png", iconWidth = 32, iconHeight = 32, name="Help" },

                         },

            xScreen = xScreen,
            yScreen = yScreen,
            wScreen = wScreen,
            hScreen = hScreen,
       },
       { -- sliding menu template 2
            appearsFrom = "left", 
            wDialog = 150, 
            overideBkColor = { 0,0,0, 0.2 }, 
            bkGradient =  {
                type = "gradient",
                color1 = { 23/255, 172/255, 254/255  },
                color2 = { 102/255, 244/255, 134/255  },
                direction = "down",
            },
            buttonHandler = callBack, 
            borderSize = 4,

            itemListTextMarginPadding = 44,
            itemListIconMarginPadding = 10, 
            itemListJustify = "left",
            itemListcenterSpacing = 5,
            itemListFont = native.systemFont,
            itemListFontSize = 12,

            itemList = { { iconFilename="assets/head.png", iconWidth = 96, iconHeight = 96, name="Mr. Cat!", height = 142, justify="center" },
                         { separator = true, height = 1, color = {1,1,1,0.5}, width = 120, justify = "center" },
                         { iconFilename="assets/Basket-WF.png", iconWidth = 24, iconHeight = 24, name="Cart", height = 50 },
                         { iconFilename="assets/Cloud-WF.png", iconWidth = 24, iconHeight = 24, name="Cloud Access", height = 50 },
                         { iconFilename="assets/Mail1-WF.png", iconWidth = 24, iconHeight = 24, name="Email Us", height = 50 },
                         { iconFilename="assets/MS Config Manage-01-WF.png", iconWidth = 24, iconHeight = 24, name="Settings", height = 50 },
                         { iconFilename="assets/Rating - 01.png", iconWidth = 24, iconHeight = 24, name="Rate Us", height = 50 },
                         { iconFilename="assets/Help.png", iconWidth = 24, iconHeight = 24, name="Help", height = 50 },

                         },

            xScreen = xScreen,
            yScreen = yScreen,
            wScreen = wScreen,
            hScreen = hScreen,
        },
        { -- sliding menu template 3
            appearsFrom = "right",
            wDialog = 150,
            overideBkColor = { 0,0,0, 0.2 },
            buttonHandler = callBack,
            borderSize = 4,

            itemListTextMarginPadding = 44,
            itemListIconMarginPadding = 10, 

            itemListJustify = "right",
            itemListcenterSpacing = 5,
            itemListFont = native.systemFont,
            itemListFontSize = 12,

            itemList = { { iconFilename="assets/head.png", iconWidth = 96, iconHeight = 96, name="Mr. Cat!", height = 142, justify="center" },
                         { separator = true, height = 1, color = {1,1,1,0.2}, width = 120, justify = "center" },
                         { iconFilename="assets/Basket-WF.png", iconWidth = 24, iconHeight = 24, name="Cart", height = 50, id=1 },
                         { iconFilename="assets/Cloud-WF.png", iconWidth = 24, iconHeight = 24, name="Cloud Access", height = 50, iconColor={0.5,0.5,1}, labelNormal={0.5,0.5,1}, },
                         { iconFilename="assets/Mail1-WF.png", iconWidth = 24, iconHeight = 24, name="Email Us", height = 50 },
                         { iconFilename="assets/MS Config Manage-01-WF.png", iconWidth = 24, iconHeight = 24, name="Settings", height = 50 },
                         { separator = true, height = 4, color = {1,0.1,0.4},  },
                         { iconFilename="assets/Rating - 01.png", iconWidth = 24, iconHeight = 24, name="RATE US", height = 50, justify = "center", fontSize=8, bkNormal = {1,0.3,0.6}, iconColor={1,1,1}, labelNormal={1,1,1},  },
                         { separator = true, height = 4, color = {0,0.5,0},},
                         { iconFilename="assets/Help.png", iconWidth = 48, iconHeight = 48, name="HELP", height = 100, justify = "center", fontSize=14, centerSpacing=10, bkNormal = {0.5,1,0.5}, iconColor={0,0.5,0}, labelNormal={0,0.5,0}, },

                         },
                         
            xScreen = xScreen,
            yScreen = yScreen,
            wScreen = wScreen,
            hScreen = hScreen,
        }
    }
    
    scene.menuExample = scene.menuExample + 1
    if scene.menuExample > #slidingMenuTable then
        scene.menuExample = 1
    end

    local error = uiLib.displaySlidingDialog( slidingMenuTable[ scene.menuExample ] )
    print( error ) 
end




doUIButton = function()
    
    local buttonRect1Instance
    local buttonRect2Instance
    local buttonRect3Instance
    local buttonRect4Instance
    local buttonCircleInstance
    local buttonRect5Instance
    mainUIGroup.isVisible = false
    
    
    local rcBack = display.newRect( xScreen, yScreen, wScreen, hScreen )
    rcBack.anchorX = 0
    rcBack.anchorY = 0
    rcBack:setFillColor(0.8)
    
    local function buttonCallback()
        mainUIGroup.isVisible = true
        buttonRect1Instance:removeSelf()
        buttonCircleInstance:removeSelf()
        buttonRect2Instance:removeSelf()
        buttonRect3Instance:removeSelf()
        buttonRect4Instance:removeSelf()
        buttonRect5Instance:removeSelf()
        
        rcBack:removeSelf()
    end
    
    local function buttonOnOff()
        if buttonCircleInstance:isSelected() == false then
            buttonCircleInstance:select(true)
        else
            buttonCircleInstance:select(false)
        end
    end
    
    local yOffset = 50
    local circleOptions = {
    
       callBack = buttonOnOff,

        x = 100,
        y = yOffset,
        w = 120,
        h = 120,
        spaceBetweenIconAndText = 5,
        
        align = "center",
        touchEffect = "smaller",
        
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
            icon = "assets/power.png",        
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
    buttonCircleInstance, error = braintonikDialog.newUIButton( circleOptions )
    print( buttonCircleInstance, error )
    
    local options = {
    
        -- group = nil,
        callBack = buttonCallback,

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
    
    buttonRect1Instance, error = braintonikDialog.newUIButton( options )
    print( buttonRect1Instance, error )
    
    local options = {
    
        callBack = buttonCallback,

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
            icon = "assets/pin.png",        
            w = 24,
            h = 24,
        },
    }
    
    buttonRect2Instance, error = braintonikDialog.newUIButton( options )
    print( buttonRect2Instance, error )
    
    local options = {
    
        callBack = buttonCallback,

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
            icon = "assets/pin.png",        
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
    
    buttonRect4Instance, error = braintonikDialog.newUIButton( options )
    print( buttonRect4Instance, error )
    
    local options = {
    
        callBack = buttonCallback,

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
        
        shapeBkSelGradientColor = {
            type = "gradient",
            color1 = { 0.7, 0.7, 0.7 },
            color2 = {0.9, 0.9, 0.9  },
            direction = "up"
        },

        textTable = {
            text = "On",
            textSel = "Off",
            fontSize = 14,
            fontType = native.systemFont,
            color = { 0.3,0.3,0.3 },
        },
        
        iconTable = {
            icon = "assets/power.png",        
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
    
    buttonRect3Instance, error = braintonikDialog.newUIButton( options )
    print( buttonRect3Instance, error )
    
    local options = {
    
        callBack = buttonCallback,

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
    
    buttonRect5Instance, error = braintonikDialog.newUIButton( options )
    print( buttonRect5Instance, error )
end

 
end
 
 

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )

-- -----------------------------------------------------------------------------------
 
return scene