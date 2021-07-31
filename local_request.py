import json
import os
import pandas as pd

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


def get_index_and_value(df, date):

    label = date
    value_of_result = df.loc[label == df["date"], ["date","value"]]
    return value_of_result.index[0], value_of_result.tolist()[0]

def select_12_days(df, result_index):

    current = result_index
    return df.iloc[current-24*12 : current]

def percent_flood(df, data):
    list_selection = df.tolist()
    final = len([x for x in list_selection if data > x])
    return (final/288) * 100


if __name__ == '__main__':
    #print(import_forecast("forecast.json"))
    file = "era5_volumetric_soil_water_layer_1-hourly-5.0405866_7.9194225.csv"
    df = import_volumetric(file)
    date = "2021-01-07 00:00:00"
    index, value = get_index_and_value(df, date)
    print(index)

    selection = select_12_days(df, index)
    print(selection)

    percent = percent_flood(selection, value)
    print(percent)
