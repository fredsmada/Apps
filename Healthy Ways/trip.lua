local composer = require( "composer" )
local scene = composer.newScene()
local sqlite3 = require( "sqlite3" )

--Open database
local path = system.pathForFile( "data.db", system.DocumentsDirectory )
local db = sqlite3.open( path )

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

--Initialize variables

local function GoToMenu()
	composer.gotoScene("menu", {time=800, effect="crossFade"})
end

local function GoToCalendar()
	composer.gotoScene("calendar", {time=800, effect="crossFade"})
end

local function pullTotals()
	local text = {}
	local query = "SELECT Total FROM dayData"
	for row in db:nrows(query) do
		text[#text+1] = 
		{
			Total = row.Total
		}
	end
	return text
end

local musicTrack

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )


	--Load the music
	audio.reserveChannels(1)
	musicTrack = audio.loadStream("audio/04 - How Far I_ll Go.wav")

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase


	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
		local background = display.newImageRect(sceneGroup, "ocean.jpg", 400, 700)
		background.x = display.contentCenterX
		background.y = display.contentCenterY
	
		local menuButton = display.newText(sceneGroup, "Menu", display.contentCenterX, 10, native.systemFont, 25)
		menuButton:setFillColor(1,1,1)
		menuButton:addEventListener("tap", GoToMenu)

		local calendarButton = display.newText(sceneGroup, "Calendar", display.contentCenterX, 50, native.systemFont, 25)
		calendarButton:setFillColor(1,1,1)
		calendarButton:addEventListener("tap", GoToCalendar)

		local totals = pullTotals()
		local grandTotals = 0
		for i=1, #totals do
			grandTotals = grandTotals + totals[i].Total
		end
		local yourProgress = display.newText(sceneGroup, "Your Points Total: "..grandTotals, display.contentCenterX, 150, native.systemFont, 25)
		if(grandTotals > 2827) then
			grandTotals = 2827
		end
		local hawaiiTotal = "2827"
		local hawaiiMath = tonumber(hawaiiTotal) - grandTotals
		local totalProgress = display.newText(sceneGroup, "Maui is "..hawaiiTotal.." miles away", display.contentCenterX, 250, native.systemFont, 25)
		local hawaiiProgress = display.newText(sceneGroup, "You have "..hawaiiMath.." miles to go!", display.contentCenterX, 350, native.systemFont, 25)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

		--Start the music
        audio.play(musicTrack, {channel=1, loops=-1})
	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

		-- Stop the music!
        audio.stop( 1 )

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		composer.removeScene("trip")
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

	--Dispose audio
	audio.dispose(musicTrack)
end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
