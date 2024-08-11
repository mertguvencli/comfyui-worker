import logging
import sys

file_handler = logging.FileHandler(filename='worker.log')
stdout_handler = logging.StreamHandler(stream=sys.stdout)
handlers = [file_handler, stdout_handler]

logging.basicConfig(
    level=logging.DEBUG,
    format='[%(asctime)s] %(levelname)s - %(message)s',
    handlers=handlers
)

logger = logging.getLogger('worker')
