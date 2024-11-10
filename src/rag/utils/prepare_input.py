import os
import numpy as np
import pandas as pd
from loguru import logger


def jsonify_dataset(source_fp: str) -> None:
    if not os.path.exists(source_fp):
        logger.error('File does not exist:', source_fp)
        return
    df = pd.read_csv(source_fp)
    df.replace(np.nan, None, inplace=True)
    return df.to_dict(orient='records')
