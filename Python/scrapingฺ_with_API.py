import requests
import time
import pandas as pd

data = []

for i in range(5) :
    url = f"https://swapi.dev/api/people/{i+1}"
    rq = requests.get(url)
    
    if rq.status_code == 200:
        rq_json = rq.json()
        data.append(
            {
                "name":rq_json["name"],
                "gender":rq_json["gender"]
            }
        )
    time.sleep(1)

df = pd.DataFrame(data)
df
