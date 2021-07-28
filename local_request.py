import json

def import_forecast(filename):
    # Function to read data from local json file on the hard drive
    # Args:
    # - filename : the file name of the json which contains forecasts data
    # - the function return data var
    with open("filename") as f:
        data = json.load(f)

    return data
