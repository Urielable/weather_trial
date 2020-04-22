## Open Weather app

Application for search weather.
 
### Requirements:
Ruby Version: **2.6.3**

Rails Version: **6.0.2**

Postgres: 9 +

#### Instalation

Run:

```
bundle install
```

Create Database:

```
rake db:create
rake db:migrate
```

Run server: 

```
rails s
```

#### Test suite

For execute test run:

```
rails test
```

## Docs

### How to use

### API historical weather

**Method:** GET

**Endpoint:** `api/v1/weather`

**Attributes:**

  - attr: `[temp, temp_max, temp_min]`
  - order: `[asc, desc]`
  - sample: `http://0.0.0.0:3001/api/v1/weathers?attr=temp&order=asc`

**Response:** 

```
{
  "response": [
    {
      "id": null,
      "city_id": 7108,
      "city_name": "Monterrey",
      "temp": "33.53",
      "temp_max": "34.44",
      "temp_min": "33.0",
      "metric": "metric",
      "created_at": "2020-04-22T21:03:19.156Z"
    },
    {
      "id": null,
      "city_id": 7108,
      "city_name": "Monterrey",
      "temp": "33.9",
      "temp_max": "35.56",
      "temp_min": "33.0",
      "metric": "metric",
      "created_at": "2020-04-22T19:54:59.906Z"
    },
    {
      "id": null,
      "city_id": 7108,
      "city_name": "Monterrey",
      "temp": "33.92",
      "temp_max": "35.56",
      "temp_min": "33.0",
      "metric": "metric",
      "created_at": "2020-04-22T19:55:58.679Z"
    }
  ]
}
```

### API real weather

**Method:** GET

**Endpoint:** `api/v1/weather/show`

**Response:** 

```
 {
  "weather": {
    "id": 4,
    "city_id": 7108,
    "city_name": "Monterrey",
    "temp": "34.0",
    "temp_max": "34.0",
    "temp_min": "34.0",
    "metric": "metric",
    "created_at": "2020-04-22T22:12:04.583Z",
    "updated_at": "2020-04-22T22:12:04.583Z"
  }
}
```

**Method:** GET

**Endpoint:** `api/v1/weather/find`

**Attributes:**

  - attr: `[temp, temp_max, temp_min, created_at]`
  - filter: `[max, min]`
  - sample: `http://0.0.0.0:3001/api/v1/weathers/find?attr=temp_min&filter=max`

**Response:** 

```
{
  "weather": "33.0"
}
```

#### Configuration

You can change the next enviroment variables:

```
export OPEN_WEATHER_MAP_KEY=<yourappkey>
export INTERFACTURA_APP=interfactura_app
export OPEN_WEATHER_HOST="https://api.openweathermap.org/data/2.5/"
```

### TO-DO

- Create job for run every 1 hour.