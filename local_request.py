import json, os

def import_forecast(filename):
    # Function to read data from local json file on the hard drive
    # Args:
    # - filename : the file name of the json which contains forecasts data
    # - the function return data var
    filename = os.path.join(os.path.dirname(__file__), filename)
    with open(filename) as f:
        data = json.load(f)
        data = json.dumps(data) # to read in ASCII

    return data



if __name__ == '__main__':
    print(import_forecast("forecast.json"))
