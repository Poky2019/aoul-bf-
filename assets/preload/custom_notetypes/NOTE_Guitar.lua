function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Guitar Notes' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_guitar'); --Change texture


			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Guitar Note' and difficulty == 2 then
		setProperty('health', getProperty('health')-0.3);
	elseif noteType == 'Guitar Note' and difficulty == 1 then
		setProperty('health', getProperty('health')-0.3);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Guitar Note' then
	    setProperty('health', getProperty('health') +0.0475);
		addMisses(-1);
		cameraShake('camGame', 0.01, 0.2);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.001);
	end
end