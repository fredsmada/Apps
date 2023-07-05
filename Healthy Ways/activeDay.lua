local composer = require( "composer" )
 
local scene = composer.newScene()
local widget = require("widget")

function scene:create( event )
	local overlayGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
	function buttonTap(event)
		composer.hideOverlay()
	end
end

-- show()
function scene:show( event )
	local overlayGroup = self.view

	local function onSwitchPress(event)
		local switch = event.target
	end

	local overlayGroup = self.view
	local phase = event.phase
	local currentYear = os.date("%Y")
	local currentMonth = os.date("%m")
	local currentDay = os.date("%d")

	if ( phase == "will" ) then
		local overlayGroup = self.view
		-- Code here runs when the scene is still off screen (but is about to come on screen)
		back = display.newImageRect(overlayGroup, "back.png", 400, 700)
		back.x = display.contentCenterX
		back.y = display.contentCenterY

		--Display popup box
		dayBox = display.newRect(0, 0, 275, 325)
		dayBox:setFillColor(1,1,1)
		dayBox.x = display.contentCenterX
		dayBox.y = display.contentCenterY

		--Grab data of selected day
		dbInfo = pullFromDB(daySelected)
		
	elseif ( phase == "did" ) then
		local check = tonumber(daySelected)
		if(check>31) then
			daySelected = '0'
		end
		if(daySelected == '0') then
			--Display exit button
			local boxButton = display.newImage("exitButton.png", 160, 420)
			boxButton:addEventListener("tap", buttonTap)
			overlayGroup:insert(back)
			overlayGroup:insert(dayBox)
			overlayGroup:insert(boxButton)
		else
			local overlayGroup = self.view
			-- Code here runs when the scene is entirely on screen

	        --Display date of day selected
	        shownDate = dbInfo[1].Day
	       	local dateText = display.newText(overlayGroup, dbInfo[1].Day, display.contentCenterX, 150, native.systemFont, 25 )
	       	dateText:toFront()
	       	dateText:setFillColor(0.3, 0.7, 0.75)
	       	

	        --**Display Daily Points**
			--Display exercise field
			exerciseField = native.newTextField(175,190,60,30)
			exerciseField.inputType="number"
			exerciseField.text=dbInfo[1].Exercise
			exerciseField:addEventListener("userInput", textSave)

			--Display scripture field
			scriptureField = native.newTextField(175,240,60,30)
			scriptureField.inputType="number"
			scriptureField.text=dbInfo[1].Scriptures
			scriptureField:addEventListener("userInput", textSave)

			--Display food field
			foodField = native.newTextField(175,290,60,30)
			foodField.inputType="number"
			foodField.text=dbInfo[1].Food
			foodField:addEventListener("userInput", textSave)

			--Display water field
			waterField = native.newTextField(175,340,60,30)
			waterField.inputType="number"
			waterField.text=dbInfo[1].Water
			waterField:addEventListener("userInput", textSave)

			--Display total field
			totalDisplay = display.newText(overlayGroup, dbInfo[1].Total, 175, 385, native.systemFont, 25 )
			totalDisplay:setFillColor(0,0,0)
			if(dbInfo[1].Total == 0) then 
				totalDisplay.text=0
			else
				if(exerciseField.text == '' or scriptureField.text == '' or foodField.text == '' or waterField.text == '') then
				else
					totalDisplay.text = tonumber(exerciseField.text) + tonumber(scriptureField.text) + tonumber(foodField.text) + tonumber(waterField.text)
				end
			end
			
			--Display exit button
			local boxButton = display.newImage("exitButton.png", display.contentCenterX, 420)
			boxButton:addEventListener("tap", buttonTap)

			--Display item name
			local itemOne = display.newText(overlayGroup, "Exercise", 90, 190, native.systemFont, 25)
			itemOne:toFront()
			itemOne:setFillColor(.1,.5,.9)

			--Display out of a possible
			local possibleOne = display.newText(overlayGroup, "/ 30", 250, 190, native.systemFont, 25)
			possibleOne:toFront()
			possibleOne:setFillColor(0,0,0)

			--Display item name
			local itemTwo = display.newText(overlayGroup, "Scriptures", 90, 240, native.systemFont, 25)
			itemTwo:toFront()
			itemTwo:setFillColor(.1,.5,.9)

			--Display out of a possible
			local possibleTwo = display.newText(overlayGroup, "/ 20", 250, 240, native.systemFont, 25)
			possibleTwo:toFront()
			possibleTwo:setFillColor(0,0,0)

			--Display item name
			local itemThree = display.newText(overlayGroup, "Food", 90, 290, native.systemFont, 25)
			itemThree:toFront()
			itemThree:setFillColor(.1,.5,.9)

			--Display out of a possible
			local possibleThree = display.newText(overlayGroup, "/ 10", 250, 290, native.systemFont, 25)
			possibleThree:toFront()
			possibleThree:setFillColor(0,0,0)

			--Display item name
			local itemFour = display.newText(overlayGroup, "Water", 90, 340, native.systemFont, 25)
			itemFour:toFront()
			itemFour:setFillColor(.1,.5,.9)

			--Display out of a possible
			local possibleFour = display.newText(overlayGroup, "/ 10", 250, 340, native.systemFont, 25)
			possibleFour:toFront()
			possibleFour:setFillColor(0,0,0)

			--Display item name
			local itemFive = display.newText(overlayGroup, "Total", 90, 385, native.systemFont, 25)
			itemFive:toFront()
			itemFive:setFillColor(.1,.5,.9)

			--Display out of a possible
			local possibleFive = display.newText(overlayGroup, "/ 70", 250, 385, native.systemFont, 25)
			possibleFive:toFront()
			possibleFive:setFillColor(0,0,0)

			--Insert items into overlayGroup
			overlayGroup:insert(back)
			overlayGroup:insert(dayBox)
			overlayGroup:insert(boxButton)
			overlayGroup:insert(itemOne)
			overlayGroup:insert(itemTwo)
			overlayGroup:insert(itemThree)
			overlayGroup:insert(itemFour)
			overlayGroup:insert(itemFive)
			overlayGroup:insert(possibleOne)
			overlayGroup:insert(possibleTwo)
			overlayGroup:insert(possibleThree)
			overlayGroup:insert(possibleFour)
			overlayGroup:insert(possibleFive)
			overlayGroup:insert(exerciseField)
			overlayGroup:insert(scriptureField)
			overlayGroup:insert(foodField)
			overlayGroup:insert(waterField)
			overlayGroup:insert(totalDisplay)
			overlayGroup:insert(dateText)
		end
	end
end

function scene:hide( event )
	local overlayGroup = self.view
    local phase = event.phase
    local parent = event.parent  -- Reference to the parent scene object
 
    if ( phase == "will" ) then
		--remove activeDay
		composer.hideOverlay("fade", 400 )
		composer.removeScene("activeDay")
    end
end


-- destroy()
function scene:destroy( event )
	local overlayGroup = self.view
	-- Code here runs prior to the removal of scene's view
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