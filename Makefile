all : install lint test

.PHONY : all

setup:
	python3 -m venv ~/.pragai-aws

install:
	pip install -r requirements.txt

test:
	PYTHONPATH=. && pytest -vv  --cov=paws tests/*.py
	PYTHONPATH=. && py.test --nbval-lax notebooks/*.ipynb
	PYTHONPATH=. && pytest -vv --cov=paws --cov=pcli tests/*.py

lint:
	pylint --disable=R,C paws

