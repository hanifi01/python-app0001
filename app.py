from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Application is running"}


# if output is buffered, when will i get logs? = 100 seconds

# What would happen if your script crashes during the run 
# If output is not bufferd, when will iget logs? = after every count
# What would happen if our script crashes druing the run = I will know exactly at wht numner the app is crashing 

# Application - critical cannot be interupted 
# Paralell Exections can be interrupted = have output buffered 
