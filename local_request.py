import json

def import_forecast(filename):
    # Function to read data from local json file on the hard drive
    with open("filename") as f:
        data = json.load(f)
    return data
