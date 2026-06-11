ARG PYTHON_VERSION= 3.12
ARG  ALPLINE_VERSION=3.22

#python:3.12-alpine3.22 is used as bse image for the appliction 

FROM python:$ {PYTHON_VERSION}-{ALPLINE_VERSION}

# cache vs buffer 
# __pycache__ = only helps  to start python faster by resuing comiled bytecoe
#2.-- pycache-- = will have .pyc file (Image sizer)
#3. docekr image aer imutable  - we need to build a new docker image every time when thereis app udpates 
# - ---pycache--= impact repeatable docer image builds 
# ENV is used inside the running container, SHELL VARIABLE 
# Prevents python from writing PYC files 
ENV PYTHONDONTWRITEBYTCODE=1
# Buffering in Python
# Buffering = instead of sending outputs  piece by piece the buffering sends a single output


ENV PYTHONBUFFERED=1 

WORKDIR /app