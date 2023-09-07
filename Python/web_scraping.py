!pip install gazpacho
!pip list | grep "gaz"

from gazpacho import Soup
import requests
import pandas as pd

url = "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"
data = requests.get(url)

df = Soup(data.text)

titles = df.find("h3",{"class":"lister-item-header"})
rating = df.find("div",{"class":"ratings-imdb-rating"})
runtime = df.find("span",{"class":"runtime"})
genre = df.find("span",{"class":"genre"})

clean_title = [title.strip() for title in titles]
clean_rating = [rating.strip() for rating in rating]
clean_runtime = [runtime.strip() for runtime in runtime]
clean_genre = [genre.strip() for genre in genre]

Raw_data = pd.DataFrame(data={
    "Title":clean_title,
    "Rating":clean_rating,
    "Runtime":clean_runtime,
    "Genre":clean_genre
})
