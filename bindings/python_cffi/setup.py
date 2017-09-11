################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
from setuptools import setup

setup(
    name = "malamute_cffi",
    version = "1.1.0",
    license = "mpl-2.0",
    description = """Python cffi bindings of: zeromq message broker""",
    packages = ["malamute_cffi", ],
    setup_requires=["cffi"],
    cffi_modules=[
           "malamute_cffi/build.py:ffibuilder",
           "malamute_cffi/build.py:ffidestructorbuilder"
    ],
    install_requires=["cffi"],
)
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
