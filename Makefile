run:
	docker run --rm -it new-computer

build:
	docker build . -t new-computer

dev: clean
	docker run --rm -v $(shell pwd):/home/jainish --entrypoint /bin/bash -it new-computer

clean:
	rm -rf .oh-my-* .zshrc* .zsh_history .zcompdump* \
	.gitconfig* .bash_history .npm* .local .config \
	node_modules .node_* package*.json .cache .python* \
	.ansible .ccache neovim personal .zcomp* .vim
