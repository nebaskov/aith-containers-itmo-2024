import os
import requests
from loguru import logger


BACKEND_URL = os.getenv('BACKEND_URL')


def check_health():
    resp = requests.get(BACKEND_URL + '/health')
    if resp.status_code == 200:
        logger.info('service healthy')
    else:
        logger.error('service unhealthy')


if __name__ == '__main__':
    check_health()
