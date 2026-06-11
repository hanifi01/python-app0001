ARG PYTHON_VERSION=3.12
ARG ALPLINE_VERSION=3.22

# python:3.12-alpine3.22 is used as base image for the application
FROM python:${PYTHON_VERSION}-alpine${ALPLINE_VERSION}

# cache vs buffer
# __pycache__ = only helps to start python faster by reusing compiled bytecode
# .pyc file = will have compiled Python files (increases image size)
# docker images are immutable - we need to build a new image every time app updates
# __pycache__ impacts repeatable docker image builds

# ENV is used inside the running container (shell variable)
# Prevents python from writing PYC files
ENV PYTHONDONTWRITEBYTECODE=1

# Buffering in Python
# Buffering = instead of sending outputs piece by piece, buffering sends single output
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN adduser \
    --disabled-password \
    --home /home \
    --shell /nologin \
    --no-create-home \
    --uid 1001 \
    pythonuser

USER pythonuser

COPY . .

RUN python -m pip install -r requirements.txt

EXPOSE 8000

CMD ["python3", "-m", "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]