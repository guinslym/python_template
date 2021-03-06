1 setup:
	pip install -e .
	pip install -r requirements/dev.txt

setup_ci:
	pip install -e .
	pip install -r requirements/ci.txt

ci: test lint typing
	@echo "CI complete"

lint:
	@echo "Running pylint"
	@pylint python_template tests pylint_custom --msg-template="{path}:{line}:{column} {msg_id}({symbol}) {msg}"

test:
	@echo "Running pytest"
	@py.test tests

typing:
	@echo "Running mypy"
	@mypy python_template pylint_custom tests --ignore-missing-imports
