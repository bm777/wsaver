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
    return value_of_result.index[0], value_of_result["value"].tolist()[0]

def select_12_days(df, result_index):

    current = result_index
    return df.iloc[current-24*12 : current]

def percent_flood(df, data):
    list_selection = df["value"].tolist()
    final = len([x for x in list_selection if data > x])
    return (final/288) * 100


def import_and_merge_wind(file1, file2):
    # Function to read data from local csv file on the hard drive
    # Args:
    # - filename : the file name of the csv which contains
    #   forecasts data of wind speed data
    # - the function return merged dataframe based on date column
    file1 = os.path.join(os.path.abspath(""), file1)
    file2 = os.path.join(os.path.abspath(""), file2)

    # load csv file on dataframe
    df1 = pd.read_csv(file1)
    #df2 = pd.read_csv(file2)

    # split the df
    df1[["value", "t1", "t2", "t3"]] = df1.value.str.split(" ", expand=True)
    #df2[["speed", "t1", "t2", "t3"]] = df2.value.str.split(" ", expand=True)

    # remove column unusable
    df1.pop("t1"), df1.pop("t2"), df1.pop("t3")
    #df2.pop("value"), df2.pop("t1"), df2.pop("t2"), df2.pop("t3")

    # merge df1 and df2 based on date column
    #df = pd.merge(df1, df2, on="date")

    return df1





if __name__ == '__main__':
    #print(import_forecast("forecast.json"))
    # file = "era5_volumetric_soil_water_layer_1-hourly-5.0405866_7.9194225.csv"
    # df = import_volumetric(file)
    # date = "2021-01-07 00:00:00"
    # index, value = get_index_and_value(df, date)
    # print(index)
    #
    # selection = select_12_days(df, index)
    # print(selection)
    #
    # percent = percent_flood(selection, value)
    # print(percent)
    pass
