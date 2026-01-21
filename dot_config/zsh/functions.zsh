browser-use() {
	cd /Users/shina/Documents/web-ui
    uv venv --python 3.12
    source .venv/bin/activate
    uv pip install browser-use
    playwright install
    uv pip install -r requirements.txt
	open http://127.0.0.1:7788
	python webui.py --ip 127.0.0.1 --port 7788
}
