local sqlite3 = require( "sqlite3" )
local composer = require( "composer" )

--Open database
local path = system.pathForFile( "data.db", system.DocumentsDirectory )
local db = sqlite3.open( path )

--Set variables for DB entry
exercises = 0
scripturess = 0
foods = 0
totals = 0

function fillDB()
	local path = system.pathForFile( "data.db", system.DocumentsDirectory )
	local db = sqlite3.open( path )
	-- Set up the table if it doesn't exist
	local tablesetup = [[CREATE TABLE IF NOT EXISTS dayData (id INTEGER PRIMARY KEY, Day, Exercise, Scriptures, Food, Water, Total);]]
	db:exec( tablesetup )

	for i=1, 151 do
		if(i<=31) then
			local tablefill = "INSERT INTO dayData VALUES('"..i.."', '01/"..i.."/2019', 0, 0, 0, 0, 0)"
			db:exec(tablefill)
		elseif(i<=59) then
			local tablefill = "INSERT INTO dayData VALUES('"..i.."', '02/"..(i-31).."/2019', 0, 0, 0, 0, 0)"
			db:exec(tablefill)
		elseif(i<=90) then
			local tablefill = "INSERT INTO dayData VALUES('"..i.."', '03/"..(i-59).."/2019', 0, 0, 0, 0, 0)"
			db:exec(tablefill)
		elseif(i<=120) then
			local tablefill = "INSERT INTO dayData VALUES('"..i.."', '04/"..(i-90).."/2019', 0, 0, 0, 0, 0)"
			db:exec(tablefill)
		else
			local tablefill = "INSERT INTO dayData VALUES('"..i.."', '05/"..(i-120).."/2019', 0, 0, 0, 0, 0)"
			db:exec(tablefill)
		end
	end
end

--Create table with starting parameters
function addToDB(theDate, Exercise, Scriptures, Food, Water, Total)
	local path = system.pathForFile( "data.db", system.DocumentsDirectory )
	local db = sqlite3.open( path )

	-- Add rows but never extra rows!
	local findRow = "SELECT Day FROM dayData WHERE Day LIKE'%"..theDate.."%'"
	local finding = db:exec(findRow)
	local monthGet = theDate.sub(theDate, 1,2)
	if(monthGet=='02') then
		fillerDays = 31
	elseif(monthGet=='03') then
		fillerDays = 59
	elseif(monthGet=='04') then
		fillerDays = 90
	elseif(monthGet=='05') then
		fillerDays = 120
	else
		fillerDays = 0
	end
	local dayGet = theDate.sub(theDate,4,5)
	dateFiller = dayGet + fillerDays
	local tablefill = "UPDATE dayData VALUES('"..dateFiller.."', '"..theDate.."', '"..Exercise.."', '"..Scriptures.."', '"..Food.."', '"..Water.."') WHERE Day='"..theDate.."'"
	db:exec(tablefill)
end

--Save field information
function textSave(event)
	shownDate = dbInfo[1].Day
	if(event.phase == "editing") then
		--Store the edited fields
		if(exerciseField.text ~= nil) then
			exercises = exerciseField.text
		end
		if(scriptureField.text ~= nil) then
			scripturess = scriptureField.text
		end
		if(foodField.text ~= nil) then
			foods = foodField.text
		end
		if(waterField.text ~= nil) then
			waters = waterField.text
		end
		if(exerciseField.text.len(exerciseField.text) > 0 and scriptureField.text.len(scriptureField.text) > 0 and foodField.text.len(foodField.text) > 0 and waterField.text.len(waterField.text) > 0) then
			totals = exerciseField.text + scriptureField.text + foodField.text + waterField.text
		end
		if(exerciseField.text.len(exerciseField.text) > 0 and scriptureField.text.len(scriptureField.text) > 0 and foodField.text.len(foodField.text) > 0 and waterField.text.len(waterField.text) > 0) then
			if(tonumber(exerciseField.text) > 30 or tonumber(scriptureField.text) > 20 or tonumber(foodField.text) > 10 or tonumber(waterField.text) > 10) then
				native.showAlert("Number Too Big!", "The number you have entered is greater than the total amount possible!")
				exerciseField.text = ""
				scriptureField.text = ""
				foodField.text = ""
				waterField.text = ""

				--Remove amounts in fields so amounts allowed cannot be exceeded!
				exercises = 0
				scripturess = 0
				foods = 0
				waters = 0
				totals = 0

				--Add the edited fields to the database
				editDB(shownDate, exercises, scripturess, foods, waters, totals)
			end
		end

		--Add the edited fields to the database
		editDB(shownDate, exercises, scripturess, foods, waters, totals)

	elseif(event.phase == "ended") then

    end
end

--Edit values in database
function editDB(theDate, Exercise, Scriptures, Food, Water, Total)
	local tablefill = "UPDATE dayData SET Day='"..theDate.."', Exercise='"..Exercise.."', Scriptures='"..Scriptures.."', Food='"..Food.."', Water='"..Water.."', Total='"..Total.."' WHERE Day='"..theDate.."'"
	db:exec(tablefill)
end

--Pull info out of db
function pullFromDB(usedId)
	print(fillerDays)
	local check = tonumber(usedId)
	if(check < 1 or check > 151) then
		usedId = '0'
	end
	usedId = usedId + fillerDays
	usedId = tostring(usedId)
	local text = {}
	if(usedId=='0') then
		local text = {0,0,0,0}
		return text
	end
	local path = system.pathForFile("data.db", system.DocumentsDirectory)
	local db = sqlite3.open( path )
	-- Query the table according to the date
	if(usedId.len(usedId)<2) then
		actualId = usedId.sub(usedId, -1)
		actualId = tostring(actualId)
	else
		actualId = tostring(usedId)
	end
	local query = "SELECT * FROM dayData WHERE id='"..actualId.."'"
	for row in db:nrows(query) do
		text[#text+1] = 
		{
			Day = row.Day,
	    	Exercise = row.Exercise,
			Scriptures = row.Scriptures,
			Food = row.Food,
			Water = row.Water,
			Total = row.Total
		}
	end
	return text
end

-- Handle the "applicationExit" event to close the database
local function onSystemEvent( event )
    if ( event.type == "applicationExit" ) then              
        db:close()
    end
end
 
-- Setup the event listener to catch "applicationExit"
Runtime:addEventListener( "system", onSystemEvent )

--Hide status bar
display.setStatusBar(display.HiddenStatusBar)

--Reserve channel 1 for background music
audio.reserveChannels(1)

--Reduce the overall volume of the channel
audio.setVolume(0.3, {channel=1})

--Create database with dummy data
fillDB()

--Go to the menu screen
composer.gotoScene("menu")