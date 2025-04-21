FROM python:3.10-slim

# התקנת libGL וספריות נדרשות
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# יצירת תיקיית עבודה
WORKDIR /app

# העתקת כל קבצי הפרויקט
COPY . .

# התקנת תלותים
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# הרצת האפליקציה עם Gunicorn
CMD ["gunicorn", "main:app", "--bind", "0.0.0.0:8000"]
