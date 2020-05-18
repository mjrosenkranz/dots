function fish_mode_prompt
	switch $fish_bind_mode
		case default
			set prompt_emoji 🌵
		case insert
			set prompt_emoji 🌱
	end
end
