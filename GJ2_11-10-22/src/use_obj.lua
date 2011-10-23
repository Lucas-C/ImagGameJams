function select_objet(key)
	local object = ""
	if key == "w" then itemselected = "C" end
	if key == "x" then itemselected = "D" end
	if key == "c" then itemselected = "B" end
end

function usableWith(obstacle,object)
	return ((obstacle.oType == "s" and object == "C"
	or obstacle.oType == "w" and object == "C"
	or obstacle.oType == "p" and object == "D"
	or obstacle.oType == "w" and object == "D"
	or obstacle.oType == "s" and object == "B"
	or obstacle.oType == "p" and object == "B") and obstacle.actif )
end