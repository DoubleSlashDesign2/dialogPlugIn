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
local doSlidingDialog
local doCarouselDialog
local doUIButton

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
            elseif buttonId == "SLIDING" then
                doSlidingDialog()
            elseif buttonId == "CAROUSEL" then
                doCarouselDialog()
            elseif buttonId == "UI BUTTON" then
                doUIButton()
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
yPos = displayButton("SLIDING", yPos ) + 10
yPos = displayButton("CAROUSEL", yPos ) + 10
yPos = displayButton("UI BUTTON", yPos ) + 10

-- ************************************************************************
--
-- Display an informative dialog
--
-- ************************************************************************
local menuExample = 0
doSlidingDialog = function(params)
    
    local function callBack( itemId )
        print( "Pressed item : ", itemId )
    end
    
    local bkGradient = {
        type = "gradient",
        color1 = { 23/255, 172/255, 254/255  },
        color2 = { 102/255, 244/255, 134/255  },
        direction = "down",
    }
       
    local options = { {}, {}, {} }
    menuExample = menuExample + 1
    if menuExample > #options then
        menuExample = 1
    end
    
    options[1] = {
         appearsFrom = "left", -- optional left by default (left, right)
         wDialog = 80, -- optional width is a 3rd of the screen is left/right is specified by default
        -- hDialog = 80, -- optional, height is 3rd of the screen is top/bottom is specified by default
        --overideBkInput = false, -- optional, true by default
        overideBkColor = { 0,0,0, 0.2 }, -- optional
        bkColor = {0,0,0,0.7}, -- optional
        --bkGradient -- optional
        --bkDiagonalGradient -- optional
        buttonHandler = callBack, --required
        
        itemListHeight = 70,
        itemListTextMarginPadding = 52, -- optional default is 10
        itemListIconMarginPadding = 10, -- default is 10
        
        itemListJustify = "center", -- left, right, center -- optional defauklt is left
        itemListcenterSpacing = 5,
        itemListFont = native.systemFont, -- required
        itemListFontSize = 10, -- optional
        --itemListBkColor = { 1,1,1,1 }, -- optional
        --itemListBkSelectedColor = { 1,1,1,1 }, -- optional
        --itemListTextColor = {1,1,1,1}, -- optional
        --itemListTextSelectedColor = { 1,1,1,1 }, -- optional
        --itemListIconColor = {1,1,1,1}, -- optional
        --itemListIconSelectedColor = { 1,1,1,1 }, -- optional
        --itemIconBaseDir = -- optional  system.ResourceDirectory is default
        
        itemList = { { separator = true, height = 100, color = {0,0,0,0}, },
                     { iconFilename="Basket-WF.png", iconWidth = 32, iconHeight = 32, name="Cart" },
                     { iconFilename="Cloud-WF.png", iconWidth = 32, iconHeight = 32, name="Cloud Access" },
                     { iconFilename="Mail1-WF.png", iconWidth = 32, iconHeight = 32, name="Email Us" },
                     { iconFilename="MS Config Manage-01-WF.png", iconWidth = 32, iconHeight = 32, name="Settings" },
                     { iconFilename="Rating - 01.png", iconWidth = 32, iconHeight = 32, name="Rate Us" },
                     { iconFilename="Help.png", iconWidth = 32, iconHeight = 32, name="Help" },

                     }, -- required
        
        -- default screen
        xScreen = xScreen,
        yScreen = yScreen,
        wScreen = wScreen,
        hScreen = hScreen,
        
        --easing.inOutElastic
        
        easingOut = easing.outExpo,
        timeOut = 500,
        easingIn = easing.outExpo,
        timeIn = 500,
    }
    
    options[2] = {
        appearsFrom = "left", -- optional left by default (left, right)
        wDialog = 150, -- optional width is a 3rd of the screen is left/right is specified by default
        overideBkColor = { 0,0,0, 0.2 }, -- optional
        bkGradient = bkGradient,
        buttonHandler = callBack, --required
        
        borderSize = 4,

        itemListTextMarginPadding = 44, -- optional default is 10
        itemListIconMarginPadding = 10, -- default is 10   
        
        itemListJustify = "left", -- left, right, center -- optional defauklt is left
        itemListcenterSpacing = 5,
        itemListFont = native.systemFont, -- required
        itemListFontSize = 12, -- optional
        
        itemList = { { iconFilename="head.png", iconWidth = 96, iconHeight = 96, name="Mr. Cat!", height = 142, justify="center" },
                     { separator = true, height = 1, color = {1,1,1,0.5}, width = 120, justify = "center" },
                     { iconFilename="Basket-WF.png", iconWidth = 24, iconHeight = 24, name="Cart", height = 50 },
                     { iconFilename="Cloud-WF.png", iconWidth = 24, iconHeight = 24, name="Cloud Access", height = 50 },
                     { iconFilename="Mail1-WF.png", iconWidth = 24, iconHeight = 24, name="Email Us", height = 50 },
                     { iconFilename="MS Config Manage-01-WF.png", iconWidth = 24, iconHeight = 24, name="Settings", height = 50 },
                     { iconFilename="Rating - 01.png", iconWidth = 24, iconHeight = 24, name="Rate Us", height = 50 },
                     { iconFilename="Help.png", iconWidth = 24, iconHeight = 24, name="Help", height = 50 },

                     }, -- required
        
        -- default screen
        xScreen = xScreen,
        yScreen = yScreen,
        wScreen = wScreen,
        hScreen = hScreen,
    }
    
     options[3] = {
        appearsFrom = "right", -- optional left by default (left, right)
        wDialog = 150, -- optional width is a 3rd of the screen is left/right is specified by default
        overideBkColor = { 0,0,0, 0.2 }, -- optional
        buttonHandler = callBack, --required
        
        borderSize = 4,

        itemListTextMarginPadding = 44, -- optional default is 10
        itemListIconMarginPadding = 10, -- default is 10  
        
        itemListJustify = "right", -- left, right, center -- optional defauklt is left
        itemListcenterSpacing = 5,
        itemListFont = native.systemFont, -- required
        itemListFontSize = 12, -- optional
        
        itemList = { { iconFilename="head.png", iconWidth = 96, iconHeight = 96, name="Mr. Cat!", height = 142, justify="center" },
                     { separator = true, height = 1, color = {1,1,1,0.2}, width = 120, justify = "center" },
                     { iconFilename="Basket-WF.png", iconWidth = 24, iconHeight = 24, name="Cart", height = 50, id=1 },
                     { iconFilename="Cloud-WF.png", iconWidth = 24, iconHeight = 24, name="Cloud Access", height = 50, iconColor={0.5,0.5,1}, labelNormal={0.5,0.5,1}, },
                     { iconFilename="Mail1-WF.png", iconWidth = 24, iconHeight = 24, name="Email Us", height = 50 },
                     { iconFilename="MS Config Manage-01-WF.png", iconWidth = 24, iconHeight = 24, name="Settings", height = 50 },
                     { separator = true, height = 4, color = {1,0.1,0.4},  },
                     { iconFilename="Rating - 01.png", iconWidth = 24, iconHeight = 24, name="RATE US", height = 50, justify = "center", fontSize=8, bkNormal = {1,0.3,0.6}, iconColor={1,1,1}, labelNormal={1,1,1},  },
                     { separator = true, height = 4, color = {0,0.5,0},},
                     { iconFilename="Help.png", iconWidth = 48, iconHeight = 48, name="HELP", height = 100, justify = "center", fontSize=14, centerSpacing=10, bkNormal = {0.5,1,0.5}, iconColor={0,0.5,0}, labelNormal={0,0.5,0}, },

                     }, -- required
        
        -- default screen
        xScreen = xScreen,
        yScreen = yScreen,
        wScreen = wScreen,
        hScreen = hScreen,
    }

    local error = braintonikDialog.displaySlidingDialog( options[ menuExample ] )   
    print( error ) 
end

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
    local options = braintonikDialog.applyOptionsFromTemplate( "roundWhiteBusiness" )
    
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


    --[[]
    options[1] = {
        -- monthTable = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }, -- optional
        -- monthTableAbr = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec" }, -- optional
        -- dayTable = { "SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT" }, -- optional
        dayTableAbr = { "S", "M", "T", "W", "T", "F", "S" }, -- optional
        hDialog = 310, -- optional
        --bkColor = { 1,1,1 }, -- optional
        nextPreviousFont = native.systemFontBold, -- required
        nextPreviousFontSize = 18, -- required
        --prevNextButtonBkColor -- optional
        --prevNextTextColor -- optional
        overideBkInput = true,
        
       bkGradient = bkGradient,
        bkDiagonalGradient = true,
        
        templateStyle = "classic-1", -- optional
        --colorStyle = "grey", --"red", -- optional
        --noMonthNavigation = true,
        
        --shadowColor = {0,0,0,0.3 },
        --shadowSize = 5,
    
        monthHeightBar = 100, -- optional
        monthHeightBarColor = { 1,1,1,0 },
        
        --hideTheYear = false,
        monthNumberFont = native.systemFont, -- required
        --monthNumberFontSize = 32, -- optional
        
        weekDayFont = native.systemFont, -- required
        --weekDayFontSize = 14, -- optional
        --weekDayHeightBar = 40, -- optional
        weekDayHeightBarColor = { 1,1,1,0 }, -- optional
        weekDayTextColor = { 1,1,1 }, -- optional
        weekDayLineColor = { 1,1,1, 0 }, -- optional
        
        dateNumberFont = native.systemFont, -- required
        

        todayDateNumberColor = { 0,0,0 }, -- optional (color of the curent selected day)
        
        --dateBkUnderlineSelected = {1,1,1} -- optional only work if rectangle mode
        dateSelectedAsCircle = true,
        dateBkSelected = {1,1,1,0.2}, -- optional
        -- dateBkColor -- optional (warning mean a rect is drawn)
        --dateBkSeparator -- optional
        --dateNumberFontSize = 14, -- optional
        dateNumberColor = { 1,1,1 }, -- optional
        
        weekEndNumberColor = { 1,1,1 }, -- optional
        notInMonthNumberColor = { 1,1,1,0.2 }, -- optional
        dateBeforeTodayNumberColor = { 1,1,1, 0.2 }, -- optional
        
        --selectDays = "2017-5-18,2017-4-19",
        buttonHandler = onClickDate,
        
        -- we want to overide the default screen
        xScreen = xScreen,
        yScreen = yScreen,
        wScreen = wScreen,
        hScreen = hScreen,
    }
    --]]
     options[1] = {

        hDialog = 310, -- optional
        nextPreviousFont = native.systemFontBold, -- required

        overideBkInput = true,

        templateStyle = "classic-3",
        colorStyle = "grey",
        
        shadowColor = {0,0,0,0.3 },
        shadowSize = 5,
        
                weekDayTextColor = {0,0,0},
        weekDayHeightBarColor ={ 0,1,0},
         
        monthTextColor = {0,0,0},
        monthHeightBarColor = {1,1,1},
        
        todayDateNumberColor = {1,1,1},
        todayDateNumberBkColor={1,0,0},
    
        --monthHeightBar = 100, -- optional

        monthNumberFont = native.systemFont, -- required
        weekDayFont = native.systemFont, -- required
        dateNumberFont = native.systemFont, -- required
        
        selectDays = "2017-05-18,2017-4-19,2017-4-20,2017-4-21",
        buttonHandler = onClickDate,
        
        -- we want to overide the default screen
        xScreen = xScreen,
        yScreen = yScreen,
        wScreen = wScreen,
        hScreen = hScreen,
        
        todayDateNumberBkColor={1,0,0},
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
        spaceBetweenPrevNextButton = 20,
    
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

-- ************************************************************************
--
-- Display a carousel dialog
--
-- ************************************************************************
local carouselExample = 1
doCarouselDialog = function(params)
    
    local function onCreatePage(status, pageNumber, width, height, closeFct)
        print(status, pageNumber, width, height)
    end
    
    -- called when the user click on close button. The page parameter specify on what page was the user when he close the carousel
    local function onCloseButton(page)
        print( "onCloseButton", page )
    end
    
    -- called when the user click on an image. The page parameter specify the page in case you want to have on callback for all pages.
    local function imgCallBack(page)
        print( "imgCallBack", page )
    end
  
    local options = {
        
        bkColor = { 0,0,0,0 }, -- optional default if full black
    
        dotCircleSize = 20, -- optional default is 26
        dotSpacing = 5, -- optional default is 10
        dotColor = { 1,1,1 },  -- optional default is { 0,0,0 }
        dotBottomPadding = 20,
        
        closeIfClickOutside = true, -- false by default
        
        closeButtonLabel = "CLOSE",
        closeButtonHeight = 40, -- optional default is 40
        closeButtonFont = native.systemFont, 
        closeButtonFontSize = 18,
        
        closeButtonLabelNormal = { 0,0,0 },
        closeButtonLabelSelected = { 0,0,0,0.5 },
        closeButtonBkNormal = { 1,1,1 },
        closeButtonBkSelected = { 1,1,1, 0.5 },
        
        buttonHandler = onCloseButton,
         
        --left = 10,
        --top = 50,
        hDialog = 400,
        wDialog = 300,
        
        appearsFrom = "left",
        managePageFct = onCreatePage,
        
        itemList = { 
            { template = "image", imageDisplay="bestFit", imageFileName = "carouselImg.jpg", bkColor = {1,1,1, 0}, imgCloseCallback = imgCallBack }, -- imageFileNameBaseDir
            { template = "image", imageDisplay="maximize", imageFileName = "carouselImg.jpg" }, -- imageFileNameBaseDir
            { template = "title+text", title="Lorem ipsum", text="Cenean et iaculis quam. Morbi tincidunt finibus dui et dignissim.", titlePHeight = 60, titleFontSize = 24, textFontSize = 16, textPHeight = 40, padding = 20 },
            { template = "icon+title+text", title="Page 3 ", text="Cenean et iaculis quam. Morbi tincidunt finibus dui et dignissim.", iconCloseCallback = imgCallBack, titlePHeight = 0, titleFontSize = 24, textFontSize = 16, textPHeight = 25, padding = 20, iconPHeight = 50, iconFileName = "head.png" , iconWidth = 96, iconHeight = 96}, -- iconFileNameBaseDir
            { template = "custom" },
        },
        
        -- default screen
        xScreen = xScreen,
        yScreen = yScreen,
        wScreen = wScreen,
        hScreen = hScreen,   
    }
    
    local error = braintonikDialog.displayCarouselDialog( options )
    print(error)
end

doUIButton = function()
    
    local uiButtonGroup = display:newGroup()
    mainUIGroup.isVisible = false
    
    local rcBack = display.newRect( uiButtonGroup, xScreen, yScreen, wScreen, hScreen )
    rcBack.anchorX = 0
    rcBack.anchorY = 0
    rcBack:setFillColor(0.8)
    
    local function buttonCallback()
        mainUIGroup.isVisible = true
        uiButtonGroup:removeSelf()
        uiButtonGroup = nil
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
        
        group = uiButtonGroup,
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
    button_1, error = braintonikDialog.newUIButton( buttonExample_1 )
    print( button_1, error )
    
    local buttonExample_2 = {
    
        group = uiButtonGroup,
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
    
    local button_2, error = braintonikDialog.newUIButton( buttonExample_2 )
    print( button_1, error )
    
    local buttonExample_3 = {
        
        group = uiButtonGroup,
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
            icon = "pin.png",        
            w = 24,
            h = 24,
        },
    }
    
    local button_3, error = braintonikDialog.newUIButton( buttonExample_3 )
    print( button_3, error )
    
    local buttonExample_4 = {
        
        group = uiButtonGroup,
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
    
    local button_4, error = braintonikDialog.newUIButton( buttonExample_4 )
    print( button_4, error )
    
    local buttonExample_5 = {
        
        group = uiButtonGroup,
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
    
    local button_5, error = braintonikDialog.newUIButton( buttonExample_5 )
    print( button_5, error )
    
    local buttonExample_6 = {
        
        group = uiButtonGroup,
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
    
    local button_6, error = braintonikDialog.newUIButton( buttonExample_6 )
    print( button_6, error )
end