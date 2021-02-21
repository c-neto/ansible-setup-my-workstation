setup:
	python -m venv venv
	venv/bin/pip install -r requirements.txt
	venv/bin/ansible-galaxy collection install -r requirements.yml

run:
	venv/bin/ansible-playbook playbook-all.yml -v --ask-become-pass

only-terminal:
	venv/bin/ansible-playbook playbook-only-terminal.yml -v --ask-become-pass
