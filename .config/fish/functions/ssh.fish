# Defined in - @ line 0
function ssh --description 'alias ssh=assh wrapper ssh'
	assh wrapper ssh $argv;
end
