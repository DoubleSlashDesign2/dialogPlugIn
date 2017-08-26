-- ************************************************************************
--
-- Braintonik
--
-- Dialog and Widget UI sample code of how to use the CoronaLabs
-- Braintonik Dialog plugin
--
-- Show how to use the calendar 
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
        
        local onClickDate
        local function onCalendarButton()
            onClickDate()
        end
        scene.calendarExample = 0
        
        -- ************************************************************************
        -- Calendar table definition
        -- ************************************************************************
        
        local calendarTable = { 
            { -- first calendar template
                group = scene.myGroup,
                hDialog = 310, -- optional
                nextPreviousFont = native.systemFontBold, -- required

                overideBkInput = true,

                templateStyle = "classic-3",
                colorStyle = "grey",

                shadowColor = {0,0,0,0.3 },
                shadowSize = 5,

                monthNumberFont = native.systemFont, -- required
                weekDayFont = native.systemFont, -- required
                dateNumberFont = native.systemFont, -- required

                selectDays = "2017-05-18,2017-05-02,2017-4-19,2017-4-20,2017-4-21",
                buttonHandler = onCalendarButton,

                xScreen = xScreen,
                yScreen = yScreen,
                wScreen = wScreen,
                hScreen = hScreen,
            },
            { -- second calendar template
                group = scene.myGroup,
                dayTableAbr = { "S", "M", "T", "W", "T", "F", "S" },
                hDialog = 310,
                nextPreviousFont = native.systemFontBold, 
                nextPreviousFontSize = 18,
                overideBkInput = true,

                bkGradient = {
                    type = "gradient",
                    color1 = { 0/255, 185/255, 195/255  },
                    color2 = { 0/255, 79/255, 105/255  },
                    direction = "down",
                },
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

                buttonHandler = onCalendarButton,

                -- we want to overide the default screen
                xScreen = xScreen,
                yScreen = yScreen,
                wScreen = wScreen,
                hScreen = hScreen,
            },
            { -- third calendar template
                group = scene.myGroup,
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

                buttonHandler = onCalendarButton,

                -- we want to overide the default screen
                xScreen = xScreen,
                yScreen = yScreen,
                wScreen = wScreen,
                hScreen = hScreen,
            }
        }
        
        -- add a transition for the calendar template 1
        uiLib.addTransition( calendarTable[1], "RightToLeft" )

        
        -- display 3 calendars then quit
        onClickDate = function()
            scene.calendarExample = scene.calendarExample + 1
            if scene.calendarExample > #calendarTable then
                composer.gotoScene( "screens.menu" ) 
            else
                local error = uiLib.displayCalendarDialog( calendarTable[scene.calendarExample] )
                print( error )
            end
        end
        
        onClickDate()
         
    end
end
 
-- ************************************************************************
-- We only need to overide the show scene
scene:addEventListener( "show", scene )

 
return scene