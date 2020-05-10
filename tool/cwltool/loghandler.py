import logging
FORMAT='[ %(filename)s : %(lineno)d ]'
logging.basicConfig(filename="output.log", format=FORMAT)
_logger = logging.getLogger("cwltool")
defaultStreamHandler = logging.StreamHandler()
_logger.addHandler(defaultStreamHandler)
_logger.setLevel(logging.INFO)
