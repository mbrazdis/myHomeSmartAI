FROM python:3.11.5-slim

WORKDIR /app

# Instalare Poetry
RUN pip install poetry

# Copiere fișiere și instalare dependințe
COPY pyproject.toml poetry.lock /app/
RUN poetry install

# Copiere cod sursă
COPY . /app/

# Expune portul 8501 pentru Streamlit
EXPOSE 8501

# Comanda pentru a porni aplicația Streamlit
CMD ["poetry", "run", "streamlit", "run", "main.py"]
