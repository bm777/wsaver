import json
import os, pandas

def import_forecast(filename):
    # Function to read data from local json file on the hard drive
    # Args:
    # - filename : the file name of the json which contains forecasts data
    # - the function return data var
    filename = os.path.join(os.path.dirname(__file__), filename)
    with open(filename) as f:
        data = json.load(f)
        #data = json.dumps(data) # to read in ASCII
    return data

def import_volumetric(filename):
    # Function to read data from local csv file on the hard drive
    # Args:
    # - filename : the file name of the csv which contains
    #   forecasts data of volumetric soil data
    # - the function return data var
    filename = os.path.join(os.path.dirname(__file__), filename)
    df = pd.read_csv(filename)
    return df


def get_index_date(df, date):

    label = date
    result = df.loc[label == df["date"]]
    return result.index[0]

def select_12_days(df, result_index):

    current = result_index
    df.iloc[current-24*12 : current]


if __name__ == '__main__':
    #print(import_forecast("forecast.json"))
    file = "era5_volumetric_soil_water_layer_1-hourly-5.0405866_7.9194225.csv"
    df = import_volumetric(file)
    date = "2021-01-07 00:00:00"
    index = get_index_date()
