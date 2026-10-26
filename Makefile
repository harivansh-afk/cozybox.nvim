.PHONY: test

test:
	nvim --headless --clean --cmd "set rtp^=." -l tests/run.lua
