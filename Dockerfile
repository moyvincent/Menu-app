FROM python:3.7.3-stretch

## Step 1:
WORKDIR /menu_app

## Step 2:
COPY . app.py /menu_app/

## Step 3:
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
# hadolint ignore=DL3013

## Step 4:
# Expose port 5000
EXPOSE 5000

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]