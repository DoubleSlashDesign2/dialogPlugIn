-- ************************************************************************
--
-- Braintonik
--
-- Braintonik Dialog PlugIn Sample
--
--
-- The code demonstrate the usage of the various dialog template
-- This code is not format in any optimized way as is provided as is
-- to show quickly how to format some parameters and get visual results.
--
-- ************************************************************************
-- ************************************************************************

-- Load plugin library
local braintonikDialog = require "plugin.braintonik-dialog"

-- button for the demo
local widget = require( "widget" )
 


-- ************************************************************************
-- forward declaration
-- ************************************************************************
local doCalendarDialog
local doNormalDialog
local doInfoDialog

-- ************************************************************************
-- get the real screen area
-- ************************************************************************
local xScreen = display.contentCenterX - display.actualContentWidth / 2
local wScreen = display.actualContentWidth
local yScreen = display.contentCenterY - display.actualContentHeight / 2
local hScreen = display.actualContentHeight

-- Display a background image to put the demo in context
local img = display.newImage( "bkImg.jpg" )
img.x = display.contentWidth * 0.5
img.y = display.contentHeight * 0.5
local scale = math.max(wScreen / img.width, hScreen / img.height)
img:scale(scale, scale)
    
-- create a display group our main test
local mainUIGroup = display.newGroup()

-- display the info text
local infoText = display.newText( mainUIGroup, "Click on a button to visualize a few examples for each type of dialog.",  xScreen + 10, yScreen + 10, wScreen - 20, 0, native.systemFont, 14 )
infoText.anchorX = 0
infoText.anchorY = 0
local yPos = infoText.y + infoText.height + 20

local function displayButton(name, y )

    -- Function to handle button events
    local function handleButtonEvent( event )

        if ( "ended" == event.phase ) then
            local buttonId = event.target.id
            if buttonId == "NORMAL DIALOG" then
                doNormalDialog()
            elseif buttonId == "INFO DIALOG" then
                doInfoDialog()
            elseif buttonId == "CALENDAR" then
                doCalendarDialog()
            end
        end
    end

    -- Create the widget
    local button = widget.newButton(
        {
            x = xScreen + 20,
            y = y,
            width = wScreen - 40,
            height = 40,
            labelColor = { default={ 1, 1, 1 }, over={ 1, 1, 1, 0.5 } },
            id = name,
            label = name,
            onEvent = handleButtonEvent
        }
    )
    mainUIGroup:insert(button)
    
    button.anchorX = 0
    button.anchorY = 0
    
    return y + button.height
end

yPos = displayButton("NORMAL DIALOG", yPos ) + 10
yPos = displayButton("INFO DIALOG", yPos ) + 10
yPos = displayButton("CALENDAR", yPos ) + 10



-- ************************************************************************
--
-- Display an informative dialog
--
-- ************************************************************************
doInfoDialog = function(params)
    
    -- hide the main ui group
    mainUIGroup.isVisible = false
    
    local bkGradient = {
        type = "gradient",
        color1 = { 31/255, 245/255, 149/255  },
        color2 = { 47/255, 168/255, 153/255  },
        direction = "down",
    }
    
    -- define our parameters
    local options = {
    
        -- dialog parameters
        strokeWidth = 4,
        strokeColor = {0,0,0,1},
        bkGradient = bkGradient,
        bkDiagonalGradient = true,
        paddingLeftRight = 20,
        cornerRadius = 6,
        hDialog = 220,
        
        overideBkEffect = true,

        shadowColor = {0,0,0,0.3 },
        shadowSize = 5,
        
        iconFileName = "Transport-Van.png",
        iconFileNameBaseDir = system.ResourceDirectory,
        iconWidth = 96,
        iconHeight = 68,
        iconColor = { 47/255, 168/255, 153/255 },
        iconInCircle = true,
        iconOnTop = true,

        -- title
        titleString = "ORDER PLACED", 
        titleFont = native.systemFontBold, 
        titleFontSize = 18, 
        titleColor = { 1,1,1,1},

        -- text
        textString = "Your order has been placed and will be delivered in 2 weeks.",
        textFont = native.systemFont,
        textFontSize = 16,
        textColor = { 1,1,1, 0.7 },

        -- buttons
        buttonFont = native.systemFont, 
        buttonFontSize = 18,
        buttonLabelColor = { default = { 47/255, 168/255, 153/255 }, press = { 1,1,1 } },
        buttonColor = { default = {1,1,1,1}, press = { 47/255, 168/255, 153/255 } },
        buttonHeight = 60,
        buttonName = "OK THANKS", 
           
        -- transition
        transitionIn = "bottom",
        timeIn = 1000,
        easingIn = easing.outExpo,

        transitionOut = "bottom",
        easingOut = easing.outExpo,
        timeOut = 1000,

        -- default screen
        xScreen = xScreen,
        yScreen = yScreen,
        wScreen = wScreen,
        hScreen = hScreen,
    }    
    
    -- define our button callback handler
    local example = 0
    local function callBack( pressedButton )
        print( "Pressed button : ", pressedButton )
        
        example = example + 1
        if example == 1 then
            options.iconOnTop = nil
            options.hDialog = 260
            doInfoDialog( options )
        elseif example == 2 then
            options.iconColor = { 1,1,1 }
            options.hDialog = 280
            options.iconInCircle = nil
            doInfoDialog( options )
        elseif example == 3 then
            options.bkGradient = nil
            options.bkColor = { 227/255, 49/255, 35/255 }
            options.iconColor = { 1,1,1 }
            options.iconFileName = "happy.png"
            options.iconWidth = 64
            options.iconHeight = 64
            options.titleString = "Welcome to talk"
            options.textString = "Send friends photos, videos, locations, songs, voice messages and more."
            options.buttonName = "Let's get started"
            options.buttonLabelColor = { default = { 1,1,1 }, press = { 1,1,1 } }
            options.buttonColor = { default = {211/255, 45/255, 33/255}, press = { 164/255, 35/255, 26/255 } }
            doInfoDialog( options )
        else
            -- show the main ui group
            mainUIGroup.isVisible = true
            example = 0
        end
    end
    
    if params == nil then
        params = options
        params.buttonHandler = callBack
    end
    
    -- display the dialog
    local error = braintonikDialog.displayInfoDialog( params )
    print( error )
           
end


-- ************************************************************************
-- This method, set many of the options manually
-- ************************************************************************
local function displayADialogFromScratch()
    
    -- define our button callback handler
    local function callBack( pressedButton )
        -- hide the ui group()
        mainUIGroup.isVisible = true
    end
    
    local bkGradient = {
        type = "gradient",
        color1 = { 54/255, 59/255, 89/255  },
        color2 = { 34/255, 39/255, 69/255  },
        direction = "down"
    }
    
    -- define our parameters
    local options = {
    
            -- dialog parameters
            strokeWidth = 3,
            strokeColor = {0,0,0,1},
            bkGradient = bkGradient,
            paddingLeftRight = 20,
            cornerRadius = 8,
            callBack = callBack,

            shadowColor = {0,0,0,0.3 },
            shadowSize = 5,

            -- title
            titleString = "Album",
            titleFont = native.systemFontBold, 
            titleFontSize = 22, 
            titleVerticalAlignment = "center",
            titleColor = { 126/255, 131/255, 171/255 },
            titleMinHeight = 50,
            titleHorizontalAlignment = "Middle",

            -- text
            textString = "Are you sure you want to delete this album ?",
            textFont = native.systemFont,
            textFontSize = 18,
            textVerticalAlignment = "center", 
            textHorizontalAlignment = "Top", 
            textColor = { 126/255, 131/255, 171/255  },

           -- buttons
           buttonFont = native.systemFont, 
           buttonFontSize = 18,
           buttonLabelColor = { default = { 126/255, 131/255, 171/255 }, press = { 0,0,0,1 } },
           buttonColor = { default = {1,1,1,0.1}, press = { 166/255, 255/255, 77/255 } },
           buttonWidth = 120, 
           buttonHeight = 40,
           buttonAlignment = "center", 
           buttonCornerRadius = 4,
           buttonHandler = callBack,
           buttonName = { "Delete", "Keep it" }, 
           
        -- transition
        transitionIn = "bottom",
        timeIn = 1000,
        easingIn = easing.outExpo,
        
        transitionOut = "bottom",
        easingOut = easing.outExpo,
        timeOut = 1000,
           
        -- default screen
        xScreen = xScreen,
        yScreen = yScreen,
        wScreen = wScreen,
        hScreen = hScreen,
    }    

    -- display the dialog
    local error = braintonikDialog.displayPopupDialog( options )
    print( error )
           
end

-- ************************************************************************
-- Display a dialog using a template
-- ************************************************************************
doNormalDialog = function()
    
    -- hide the ui group()
    mainUIGroup.isVisible = false
    
    -- predefine template : "roundClassicGrey", "rectGreyBlue", "roundWhiteBlue", "roundWhiteBusiness" }
    local options = braintonikDialog.applyOptionsFromTemplate( "roundClassicGrey" )
    
    -- we want a predefined animation
    braintonikDialog.addTransition( options, "RightToLeft" )
    
    -- we want to block all touch events
    braintonikDialog.addBackgroundOptions( options, true )
    
    -- we want a background effect apply
    options.overideBkEffect = "blur" -- "b&w is also available"
    
    -- define our button callback handler
    local function callBack( pressedButton )
        print( "Pressed button : ", pressedButton )
        displayADialogFromScratch()
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

    -- display the dialog
    local error = braintonikDialog.displayPopupDialog( options )
    print( error )
end

-- ************************************************************************
-- The demo starting method
-- ************************************************************************
local calendarExample = 0
doCalendarDialog = function()
    
    -- hide the ui group()
    mainUIGroup.isVisible = false
    
    local bkGradient = {
        type = "gradient",
        color1 = { 0/255, 185/255, 195/255  },
        color2 = { 0/255, 79/255, 105/255  },
        direction = "down",
    }
    
    local options = { {}, {}, {} }
    calendarExample = calendarExample + 1
    if calendarExample > #options then
        calendarExample = 1
    end
    
    local function onClickDate()
        
        if calendarExample < #options then
            doCalendarDialog()
        
        else
            -- hide the ui group()
            mainUIGroup.isVisible = true
            calendarExample = 0 
        end
    end

     options[1] = {

        hDialog = 310, -- optional
        nextPreviousFont = native.systemFontBold, -- required

        overideBkInput = true,

        templateStyle = "classic-2",
        colorStyle = "grey",
        
        shadowColor = {0,0,0,0.3 },
        shadowSize = 5,
    
        --monthHeightBar = 100, -- optional

        monthNumberFont = native.systemFont, -- required
        weekDayFont = native.systemFont, -- required
        dateNumberFont = native.systemFont, -- required
        
        selectDays = "2017-5-18,2017-4-19,2017-4-20,2017-4-21",
        buttonHandler = onClickDate,
        
        -- we want to overide the default screen
        xScreen = xScreen,
        yScreen = yScreen,
        wScreen = wScreen,
        hScreen = hScreen,
    }
    
    options[2] = {
        dayTableAbr = { "S", "M", "T", "W", "T", "F", "S" },
        hDialog = 310,
        nextPreviousFont = native.systemFontBold, 
        nextPreviousFontSize = 18,
        overideBkInput = true,
        
        bkGradient = bkGradient,
        bkDiagonalGradient = true,
        
        templateStyle = "classic-1",
        shadowColor = {0,0,0,0.3 },
        shadowSize = 5,
    
        monthHeightBar = 100,
        monthHeightBarColor = { 1,1,1,0 },
        
        --hideTheYear = false,
        monthNumberFont = native.systemFont, -- required
        monthNumberFontSize = 26, -- optional
        
        weekDayFont = native.systemFont, -- required
        weekDayHeightBarColor = { 1,1,1,0 }, -- optional
        weekDayTextColor = { 1,1,1 }, -- optional
        weekDayLineColor = { 1,1,1, 0 }, -- optional
        
        dateNumberFont = native.systemFont, -- required
        todayDateNumberColor = { 0,0,0 }, -- optional (color of the curent selected day)
        dateSelectedAsCircle = true,
        dateBkSelected = {1,1,1,0.2}, -- optional
        dateNumberColor = { 1,1,1 }, -- optional
        
        weekEndNumberColor = { 1,1,1 }, -- optional
        notInMonthNumberColor = { 1,1,1,0.2 }, -- optional
        dateBeforeTodayNumberColor = { 1,1,1, 0.2 }, -- optional
        
        buttonHandler = onClickDate,

        -- we want to overide the default screen
        xScreen = xScreen,
        yScreen = yScreen,
        wScreen = wScreen,
        hScreen = hScreen,
    }
    
    options[3] = {
        hDialog = 310,
        nextPreviousFont = native.systemFontBold, 
        nextPreviousFontSize = 18,
        overideBkInput = true,
        overideBkColor = { 0,0,0,0.5 },
        
        bkColor = { 1,1,1,0.1 },

        templateStyle = "classic",
    
        monthHeightBar = 100,
        monthHeightBarColor = { 1,1,1,0 },
        
        --hideTheYear = false,
        monthNumberFont = native.systemFontBold, -- required
        monthNumberFontSize = 26, -- optional
        
        weekDayFont = native.systemFontBold, -- required
        weekDayHeightBarColor = { 1,1,1,0 }, -- optional
        weekDayTextColor = { 1,1,1 }, -- optional
        weekDayLineColor = { 1,1,1, 0 }, -- optional
        
        dateNumberFont = native.systemFontBold, -- required
        todayDateNumberColor = { 0,0,0 }, -- optional (color of the curent selected day)
        dateSelectedAsCircle = true,
        dateBkSelected = {1,1,1,0.2}, -- optional
        dateNumberColor = { 1,1,1 }, -- optional
        
        weekEndNumberColor = { 1,1,1 }, -- optional
        notInMonthNumberColor = { 1,1,1,0.2 }, -- optional
        dateBeforeTodayNumberColor = { 1,1,1, 0.2 }, -- optional
        
        buttonHandler = onClickDate,

        -- we want to overide the default screen
        xScreen = xScreen,
        yScreen = yScreen,
        wScreen = wScreen,
        hScreen = hScreen,
    }
    
    braintonikDialog.addTransition( options, "RightToLeft" )
    
    local error = braintonikDialog.displayCalendarDialog( options[calendarExample] )
    print( error )
end
-----------------------------------------------------------
