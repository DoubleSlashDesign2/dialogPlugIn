-- ************************************************************************
--
-- Braintonik
--
-- Dialog and Widget UI sample code of how to use the CoronaLabs
-- Braintonik Dialog plugin
--
-- Show how to use the carousel 
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
        --
        -- CAROUSEL CODE CREATION AND DEMO
        --
        -- ************************************************************************
        
        -- called when a custom page need to be created
        local function onCreatePage(status, pageNumber, width, height, closeFct)
            print(status, pageNumber, width, height)
        end

        -- called when the close button is touch with the page number
        local function onCloseButton( pageNumber )
            print( "onCloseButton", pageNumber )
            composer.gotoScene( "screens.menu" ) 
        end

        -- called when an image or an icon button are touched with the page number
        local function imgCallBack( pageNumber )
            print( "imgCallBack", pageNumber )
            composer.gotoScene( "screens.menu" ) 
        end

        -- ************************************************************************
        -- table template description of our carousel
        local options = {
                
            group = scene.myGroup,
            bkColor = { 0,0,0,0 },
            dotCircleSize = 20, 
            dotSpacing = 5,
            dotColor = { 1,1,1 },
            dotBottomPadding = 20,
            closeButtonLabel = "CLOSE",
            closeButtonHeight = 40,
            closeButtonFont = native.systemFont, 
            closeButtonFontSize = 18,
            closeButtonLabelNormal = { 0,0,0 },
            closeButtonLabelSelected = { 0,0,0,0.5 },
            closeButtonBkNormal = { 1,1,1 },
            closeButtonBkSelected = { 1,1,1, 0.5 },

            -- UNCOMMENT TO SEE WITH A CUSTOM BUTTON
            --[[
                uiButton = {
                    w = 48,
                    h = 48,
                    alignLeftRightMargin = 10,
                    spaceBetweenIconAndText = 8,
                    shapeBkColor = { 0,0,0,0.5},
                    shape = "circle",
                    shapeBkSelColor = { 1, 1, 1, 1 },
                    shapeBorder = 2,
                    iconTable = {
                        icon = "assets/close.png",        
                        w = 24,
                        h = 24,
                        iconSelColor = { 1,0,0,1},
                    },
                },
            --]]
            buttonHandler = onCloseButton,
            hDialog = 400,
            wDialog = 300,
            appearsFrom = "left",
            managePageFct = onCreatePage,

            itemList = { 
                { template = "image", imageDisplay="bestFit", imageFileName = "assets/carouselImg.jpg", bkColor = {1,1,1}, imgCloseCallback = imgCallBack },
                { template = "image", imageDisplay="maximize", imageFileName = "assets/carouselImg.jpg" }, 
                { template = "title+text", title="Lorem ipsum", text="Cenean et iaculis quam. Morbi tincidunt finibus dui et dignissim.", titlePHeight = 60, titleFontSize = 24, textFontSize = 16, textPHeight = 40, padding = 20 },
                { template = "icon+title+text", title="Page 3 ", text="Cenean et iaculis quam. Morbi tincidunt finibus dui et dignissim.", iconCloseCallback = imgCallBack, titlePHeight = 0, titleFontSize = 24, textFontSize = 16, textPHeight = 25, padding = 20, iconPHeight = 50, iconFileName = "assets/head.png" , iconWidth = 96, iconHeight = 96},
                { template = "custom" },
            },

            xScreen = xScreen,
            yScreen = yScreen,
            wScreen = wScreen,
            hScreen = hScreen,
        }

        local error = uiLib.displayCarouselDialog( options )
        print(error)        
    end
    
end
 
-- ************************************************************************
-- We only need to overide the show scene
scene:addEventListener( "show", scene )

 
return scene