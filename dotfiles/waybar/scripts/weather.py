#!/usr/bin/env python

import subprocess
from pyquery import PyQuery
import json

# weather icons
weather_icons = {
    "sunnyDay": "",
    "clearNight": "",
    "cloudyFoggyDay": "",
    "cloudyFoggyNight": "",
    "rainyDay": "",
    "rainyNight": "",
    "snowyIcyDay": "",
    "snowyIcyNight": "",
    "severe": "󰢘",
    "default": "",
}

location_id = "13078"

# get html page
url = "https://weather.com/en-US/weather/today/l/" + location_id
html_data = PyQuery(url=url)

# current temperature
temp = html_data("span[data-testid='TemperatureValue']").eq(0).text()

# current status phrase
status = html_data("div[data-testid='wxPhrase']").text()
status = f"{status[:16]}.." if len(status) > 17 else status

# status code
status_code = html_data("#regionHeader").attr("class").split(" ")[2].split("-")[2]

# status icon
icon = (
    weather_icons[status_code]
    if status_code in weather_icons
    else weather_icons["default"]
)

# temperature feels like
temp_feel = html_data(
    "div[data-testid='FeelsLikeSection'] > span > span[data-testid='TemperatureValue']"
).text()
temp_feel_text = f"Feels like {temp_feel}"

# min-max temperature
temp_min = (
    html_data("div[data-testid='wxData'] > span[data-testid='TemperatureValue']")
    .eq(1)
    .text()
)
temp_max = (
    html_data("div[data-testid='wxData'] > span[data-testid='TemperatureValue']")
    .eq(0)
    .text()
)
temp_min_max = f"  {temp_min}\t\t  {temp_max}"

# wind speed
wind_speed = html_data("span[data-testid='Wind']").text().split("\n")[1]
wind_text = f" {wind_speed}"

# humidity
humidity = html_data("span[data-testid='PercentageValue']").text()
humidity_text = f"  {humidity}"

# visibility
visbility = html_data("span[data-testid='VisibilityValue']").text()
visbility_text = f"  {visbility}"

# air quality index
air_quality_index = html_data("text[data-testid='DonutChartValue']").text()

# hourly rain prediction
prediction = html_data("section[aria-label='Hourly Forecast']")(
    "div[data-testid='SegmentPrecipPercentage'] > span"
).text()
prediction = prediction.replace("Chance of Rain", "")
prediction = f"\n\n  {prediction}" if len(prediction) > 0 else prediction

# tooltip text
tooltip_text = str.format(
    "{}\n{}\n\n{}\n{}\n{}{}",
    f"<big>{temp} {status}</big>",
    f"<small>{temp_feel_text}</small>",
    f"{temp_min_max}",
    f"{wind_text}\t{humidity_text}",
    f"{visbility_text}\t󰵃 {air_quality_index}",
    f"<i>{prediction}</i>",
)

out_data = {
    "text": f"{icon}   {temp}",
    "alt": status,
    "tooltip": tooltip_text,
    "class": status_code,
}
print(json.dumps(out_data))
