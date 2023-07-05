local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local function GoToTrip()
	composer.gotoScene("trip", {time=800, effect="crossFade"})
end

local function GoToMenu()
	composer.gotoScene("menu", {time=800, effect="crossFade"})
end

local musicTrack

-- create()
function scene:create( event )

	local previousGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	--Load in the music
	audio.reserveChannels(1)
	musicTrack = audio.loadStream("audio/Track 5.wav")

	function get_day_of_week(dd, mm, yy)
		dw=os.date('*t',os.time{year=currentYear,month=currentMonth,day=currentDay})['wday']
		return dw,({"Sun","Mon","Tue","Wed","Thu","Fri","Sat" })[dw]
	end

	local background = display.newImageRect(previousGroup, "waterfall.jpg", 400, 700)
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	--Function to show overlay
	function displayDay(event)
		local start = firstDay
		local options =
		{
		    isModal = true,
		    effect = "fade",
		    time = 400
		}

		if(event.y >= 172 and event.y < 221) then
			if(event.x >= 24 and event.x < 58) then
				--1st box
				if(start==1) then
					daySelected = '1'
				else
					daySelected = '0'
				end
			elseif(event.x >= 65 and event.x < 101) then
				--2nd box
				if(start==2) then
					daySelected = '1'
				elseif(daySelected ~= '0') then
					daySelected = '2'
					local set = tostring(daySelected - start+1)
					daySelected = set
				else
					daySelected = '0'
				end
			elseif(event.x >= 107 and event.x < 145) then
				--3rd box
				if(start==3) then
					daySelected = '1'
				elseif(daySelected ~= '0') then
					daySelected = '3'
					local set = tostring(daySelected - start+1)
					daySelected = set
				else
					daySelected = '0'
				end
			elseif(event.x >= 149 and event.x < 188) then
				--4th box
				if(start==4) then
					daySelected = '1'
				elseif(daySelected ~= '0') then
					daySelected = '4'
					local set = tostring(daySelected - start+1)
					daySelected = set
				else
					daySelected = '0'
				end
			elseif(event.x >= 190 and event.x < 228) then
				--5th box
				if(start==5) then
					daySelected = '1'
				elseif(daySelected ~= '0') then
					daySelected = '5'
					local set = tostring(daySelected - start+1)
					daySelected = set
				else
					daySelected = '0'
				end
			elseif(event.x >= 232 and event.x < 269) then
				--6th box
				if(start==6) then
					daySelected = '1'
				elseif(daySelected ~= '0') then
					daySelected = '6'
					local set = tostring(daySelected - start+1)
					daySelected = set
				else
					daySelected = '0'
				end
			elseif(event.x >= 275 and event.x < 310) then
				--Last box
				if(start==7) then
					daySelected = '1'
				elseif(daySelected ~= '0') then
					daySelected = '7'
					local set = tostring(daySelected - start+1)
					daySelected = set
				else
					daySelected = '0'
				end
			else
				daySelected = '0'
			end
		elseif(event.y >= 231 and event.y < 277) then
			if(event.x >= 24 and event.x < 58) then
				local correctNum = 9-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 65 and event.x < 101) then
				local correctNum = 10-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 107 and event.x < 145) then
				local correctNum = 11-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 149 and event.x < 188) then
				local correctNum = 12-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 190 and event.x < 228) then
				local correctNum = 13-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 232 and event.x < 269) then
				local correctNum = 14-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 275 and event.x < 310) then
				local correctNum = 15-start
				daySelected = tostring(correctNum)
			else
				daySelected = '0'
			end
		elseif(event.y >= 288 and event.y < 331) then
			if(event.x >= 24 and event.x < 58) then
				local correctNum = 16-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 65 and event.x < 101) then
				local correctNum = 17-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 107 and event.x < 145) then
				local correctNum = 18-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 149 and event.x < 188) then
				local correctNum = 19-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 190 and event.x < 228) then
				local correctNum = 20-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 232 and event.x < 269) then
				local correctNum = 21-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 275 and event.x < 310) then
				local correctNum = 22-start
				daySelected = tostring(correctNum)
			else
				daySelected = '0'
			end
		elseif(event.y >= 340 and event.y < 383) then
			if(event.x >= 24 and event.x < 58) then
				local correctNum = 23-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 65 and event.x < 101) then
				local correctNum = 24-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 107 and event.x < 145) then
				local correctNum = 25-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 149 and event.x < 188) then
				local correctNum = 26-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 190 and event.x < 228) then
				local correctNum = 27-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 232 and event.x < 269) then
				local correctNum = 28-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 275 and event.x < 310) then
				local correctNum = 29-start
				daySelected = tostring(correctNum)
			else
				daySelected = '0'
			end
		elseif(event.y >= 397 and event.y < 441) then
			if(event.x >= 24 and event.x < 58) then
				local correctNum = 30-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 65 and event.x < 101) then
				local correctNum = 31-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 107 and event.x < 145) then
				local correctNum = 32-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 149 and event.x < 188) then
				local correctNum = 33-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 190 and event.x < 228) then
				local correctNum = 34-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 232 and event.x < 269) then
				local correctNum = 35-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 275 and event.x < 310) then
				local correctNum = 36-start
				daySelected = tostring(correctNum)
			else
				daySelected = '0'
			end
		elseif(event.y >= 450 and event.y < 496) then
			if(event.x >= 24 and event.x < 58) then
				local correctNum = 37-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 65 and event.x < 101) then
				local correctNum = 38-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 107 and event.x < 145) then
				local correctNum = 39-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 149 and event.x < 188) then
				local correctNum = 40-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 190 and event.x < 228) then
				local correctNum = 41-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 232 and event.x < 269) then
				local correctNum = 42-start
				daySelected = tostring(correctNum)
			elseif(event.x >= 275 and event.x < 310) then
				local correctNum = 43-start
				daySelected = tostring(correctNum)
			else
				daySelected = '0'
			end
		else
			daySelected = '0'
		end
		pullFromDB(daySelected)
		composer.showOverlay("activeDay", options)
	end

	function setCalendar(currentMonth)
		local menuButton = display.newText(previousGroup, "Menu", display.contentCenterX, 10, native.systemFont, 25)
		menuButton:setFillColor(1,1,1)
		menuButton:addEventListener("tap", GoToMenu)

		local pointsButton = display.newText(previousGroup, "Trip Progress", display.contentCenterX, 50, native.systemFont, 25)
		pointsButton:setFillColor(1,1,1)
		pointsButton:addEventListener("tap", GoToTrip)

		--Create Calendar--

		--Get first day of the month
		local date = os.date()
		local currentYear = os.date("%Y")
		--local currentMonth = os.date("%m")
		local currentDay = os.date("%d")
		currentMonth = originalMonth
		if(currentMonth=='01') then
			firstDay = 3
		elseif(currentMonth=='02') then
			firstDay = 6
		elseif(currentMonth=='03') then
			firstDay = 6
		elseif(currentMonth=='04') then
			firstDay = 2
		elseif(currentMonth=='05') then
			firstDay = 4
		end

		--Store days in month
		if(currentMonth == '01') then
			tot = 31
			monthSpot = "January"
		end
		if(currentMonth == '02') then
			tot = 28
			monthSpot = "February"
		end
		if(currentMonth == '03') then
			tot = 31
			monthSpot = "March"
		end
		if(currentMonth == '04') then
			tot = 30
			monthSpot = "April"
		end
		if(currentMonth == '05') then
			tot = 31
			monthSpot = "May"
		end
		if(currentMonth == '06') then
			tot = 30
		end
		if(currentMonth == '07') then
			tot = 31
		end
		if(currentMonth == '08') then
			tot = 31
		end
		if(currentMonth == '09') then
			tot = 30
		end
		if(currentMonth == '10') then
			tot = 31
		end
		if(currentMonth == '11') then
			tot = 30
		end
		if(currentMonth == '12') then
			tot = 31
		end

		--Display Month at top
		local monthDisplay = display.newText(previousGroup, monthSpot, display.contentCenterX, 115, native.systemFont, 35 )
		monthDisplay:setFillColor(0.9, 0.9, 0)
		--Display days of week. Make array of days
		local allDays = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"}
		--Display first row of calendar
		for i=1,7 do
			if(i==1) then
				local boxes = display.newRect(previousGroup, 42, 198, 40, 50)
				boxes:setFillColor(0.5,0.5,0.5,0.5)
				boxes:addEventListener("tap", displayDay)
			else
				local boxes = display.newRect(previousGroup, 42*i, 198, 40, 50)
				boxes:setFillColor(0.5,0.5,0.5,0.5)
				boxes:addEventListener("tap", displayDay)
			end
		end

		--Display 2nd row
		for j=1,7 do
			if(j==1) then
				local boxes = display.newRect(previousGroup, 42, 255, 40, 50)
				boxes:setFillColor(0.5,0.5,0.5,0.5)
				boxes:addEventListener("tap", displayDay)
			else
				local boxes = display.newRect(previousGroup, 42*j, 255, 40, 50)
				boxes:setFillColor(0.5,0.5,0.5,0.5)
				boxes:addEventListener("tap", displayDay)
			end
		end

		--Display 3rd row
		for k=1,7 do
			if(k==1) then
				local boxes = display.newRect(previousGroup, 42, 310, 40, 50)
				boxes:setFillColor(0.5,0.5,0.5,0.5)
				boxes:addEventListener("tap", displayDay)
			else
				local boxes = display.newRect(previousGroup, 42*k, 310, 40, 50)
				boxes:setFillColor(0.5,0.5,0.5,0.5)
				boxes:addEventListener("tap", displayDay)
			end
		end

		--Display 4th row
		for l=1,7 do
			if(l==1) then
				local boxes = display.newRect(previousGroup, 42, 365, 40, 50)
				boxes:setFillColor(0.5,0.5,0.5,0.5)
				boxes:addEventListener("tap", displayDay)
			else
				local boxes = display.newRect(previousGroup, 42*l, 365, 40, 50)
				boxes:setFillColor(0.5,0.5,0.5,0.5)
				boxes:addEventListener("tap", displayDay)
			end
		end

		--Display 5th row
		for a=1,7 do
			if(a==1) then
				local boxes = display.newRect(previousGroup, 42, 475, 40, 50)
				boxes:setFillColor(0.5,0.5,0.5,0.5)
				boxes:addEventListener("tap", displayDay)
			else
				local boxes = display.newRect(previousGroup, 42*a, 475, 40, 50)
				boxes:setFillColor(0.5,0.5,0.5,0.5)
				boxes:addEventListener("tap", displayDay)
			end
		end

		--Display last row
		for m=1,7 do
			if(m==1) then
				local boxes = display.newRect(previousGroup, 42, 420, 40, 50)
				boxes:setFillColor(0.5,0.5,0.5,0.5)
				boxes:addEventListener("tap", displayDay)
			else
				local boxes = display.newRect(previousGroup, 42*m, 420, 40, 50)
				boxes:setFillColor(0.5,0.5,0.5,0.5)
				boxes:addEventListener("tap", displayDay)
			end
		end

		--Display day numbers on calendar
		--First Row
		local startDays = 0
		local boxNum = 0
		selectedDay = {}
		--local currentMonth = os.date("%m")
		local currentYear = os.date("%Y")
		for h=1, 7 do
			if (firstDay==h) then
				local dayNumber = h
				setDay = display.newText(previousGroup, "1", 42*firstDay, 195, native.systemFont, 27)
				startDays = '1'
				setDay:setFillColor(1,.8,0)
				--Need to find a way to not overwrite this. Possibly save in db?
				setDay.myName = "Name"..startDays
				startDays = startDays + 1
			end
			--Show days of week at top
			local dayDigit = h-firstDay+1
			if(dayDigit > 1) then
				local setDay = display.newText(previousGroup, h-firstDay+1, 42*h, 195, native.systemFont, 27)
				setDay:setFillColor(1,.8,0)
				startDays = startDays + 1
			end
			local dayDisplay = allDays[h]
			setDay = display.newText(previousGroup, allDays[h], 42*h, 160, native.systemFont, 18)
			setDay:setFillColor(.5,0,.75)
			if(h<10) then
				h='0'..h
			end
			local dayTotals = {
				--Fields going into database
				(currentMonth..'/'..h..'/'..currentYear),0,0,0,0,0,0
			}
			addToDB(dayTotals[1], dayTotals[2], dayTotals[3], dayTotals[4], dayTotals[5], dayTotals[6])
			table.insert(selectedDay, h)
			local h = h + 1
			startDays = h
		end

		--Second row
		for i=8, 14 do
			local setDay = display.newText(previousGroup, i-firstDay+1, 42*(i-7), 258, native.systemFont, 27)
			setDay:setFillColor(1,.8,0)
			setDay.myName = "Name"..i
			if(i<10) then
				i='0'..i
			end
			local dayTotals = {
					--Fields going into database
					(currentMonth..'/'..i..'/'..currentYear),0,0,0,0,0
				}
			if(dbInfo == nil) then
				addToDB(dayTotals[1], dayTotals[2], dayTotals[3], dayTotals[4], dayTotals[5], dayTotals[6])
			end
			table.insert(selectedDay, startDays)
			i = i + 1
			startDays = i
		end

		--Third row
		for j=15, 21 do
			local setDay = display.newText(previousGroup, j-firstDay+1, 42*(j-14), 308, native.systemFont, 27)
			setDay:setFillColor(1,.8,0)
			setDay.myName = "Name"..j
			local dayTotals = {
					--Fields going into database
					(currentMonth..'/'..j..'/'..currentYear),0,0,0,0,0
				}
			if(dbInfo == nil) then
				addToDB(dayTotals[1], dayTotals[2], dayTotals[3], dayTotals[4], dayTotals[5], dayTotals[6])
			end
			table.insert(selectedDay, startDays)
			j = j + 1
			startDays = j
		end

		--Fourth row
		for k=22, 28 do
			if(28 >= k-firstDay+1) then
				local setDay = display.newText(previousGroup, k-firstDay+1, 42*(k-21), 363, native.systemFont, 27)
				setDay:setFillColor(1,.8,0)
				setDay.myName = "Name"..k
				local dayTotals = {
					--Fields going into database
					(currentMonth..'/'..k..'/'..currentYear),0,0,0,0,0
				}
				if(dbInfo == nil) then
					addToDB(dayTotals[1], dayTotals[2], dayTotals[3], dayTotals[4], dayTotals[5], dayTotals[6])
				end
				table.insert(selectedDay, startDays)
				k = k + 1
				startDays = k
			end
		end

		--Fifth row
		for l=29, 35 do
			if(tot >= (l-firstDay+1)) then
				local setDay = display.newText(previousGroup, l-firstDay+1, 42*(l-28), 418, native.systemFont, 27)
				setDay:setFillColor(1,.8,0)
				setDay.myName = "Name"..l
				local dayTotals = {
					--Fields going into database
					(currentMonth..'/'..l..'/'..currentYear),0,0,0,0,0
				}
				if(l<=tot) then
					if(dbInfo == nil) then
						addToDB(dayTotals[1], dayTotals[2], dayTotals[3], dayTotals[4], dayTotals[5], dayTotals[6])
					end
				end
				table.insert(selectedDay, startDays)
				l = l + 1
				startDays = l
			end
		end
		--Any left over days?
		for q=36, 39 do
			if(tot >= (q-firstDay+1)) then
				local setDay = display.newText(previousGroup, q-firstDay+1, 42*(q-35), 473, native.systemFont, 27)
				setDay:setFillColor(1,.8,0)
				setDay.myName = "Name"..q
				local dayTotals = {
					--Fields going into database
					(currentMonth..'/'..q..'/'..currentYear),0,0,0,0,0
				}
				if(q<=tot) then
					if(dbInfo == nil) then
						addToDB(dayTotals[1], dayTotals[2], dayTotals[3], dayTotals[4], dayTotals[5], dayTotals[6])
					end
				end
				table.insert(selectedDay, startDays)
				q = q + 1
				startDays = q
			end
		end
		startDays = startDays - 1
	end
	setCalendar(originalMonth)
	--Functions for previous/next month buttons
	local function previousMonth()
		--Evaluate what month we need to move to
		originalMonth = tonumber(originalMonth)
		if(originalMonth < 1) then
			originalMonth = 1
			originalMonth = '0'..tostring(originalMonth)
		end
		originalMonth = '0'..tostring(originalMonth - 1)

		composer.gotoScene("menu", {time=800, effect="crossFade"})
		composer.removeScene("next2")
		composer.gotoScene("next", {time=800, effect="crossFade"})
	end
	--Show previous and next month arrows
	local leftArrow = display.newImageRect(previousGroup, "leftArrow.png", 25, 25)
	leftArrow.x = 20
	leftArrow.y = 115
	leftArrow:addEventListener("tap", previousMonth)
end
-- show()
function scene:show( event )

	local previousGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		--Start the music
        audio.play(musicTrack, {channel=1, loops=-1})
	end
end


-- hide()
function scene:hide( event )

	local previousGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

		-- Stop the music!
        audio.stop( 1 )

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		composer.removeScene("next2")
	end
end


-- destroy()
function scene:destroy( event )

	local previousGroup = self.view
	-- Code here runs prior to the removal of scene's view
	--Dispose audio
	audio.dispose(musicTrack)
	local sceneGroup = nil
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