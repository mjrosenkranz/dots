function fish_prompt
	set_color green
	echo -n (prompt_pwd)
	# echo " $prompt_emoji"
	echo " 🌱"
	echo -n "\$ "
	set_color normal
end
