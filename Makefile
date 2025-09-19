.PHONY: help all test lint fastlint doc clean

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

all: lint test ## Run all checks and tests

test: ## Run tests
	@echo "Running tests..."
	nvim --headless --clean -u tests/minimal_init.lua -c "PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal_init.lua'}"

lint: ## Run all linters
	luacheck lua/ --globals vim
	stylua --check lua/ plugin/

fastlint: ## Run fast linters only
	luacheck lua/ --globals vim

format: ## Format code
	stylua lua/ plugin/

doc: ## Generate documentation
	@echo "Generating documentation..."
	nvim --headless --clean -c "helptags doc/" -c "quit"

clean: ## Clean generated files
	rm -rf doc/tags

install-deps: ## Install development dependencies
	@echo "Installing luacheck and stylua..."
	luarocks install luacheck || echo "luacheck installation failed"
	@echo "Install stylua manually: cargo install stylua"

.DEFAULT_GOAL := help
