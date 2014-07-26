# lita-time

[![Build Status](https://travis-ci.org/harlanbarnes/lita-time.png?branch=master)](https://travis-ci.org/harlanbarnes/lita-time)
[![Coverage Status](https://coveralls.io/repos/harlanbarnes/lita-time/badge.png)](https://coveralls.io/r/harlanbarnes/lita-time)

**lita-time** is a handler for [Lita](https://github.com/jimmycuadra/lita) that uses the [World Weather Online](http://www.worldweatheronline.com) Time Zone API to look up local time in a given location.

## Installation

Add lita-time to your Lita instance's Gemfile:

``` ruby
gem "lita-time"
```

## Configuration

### Required attributes

* `apikey` - (String) - An key to access the free API. Sign up at [World Weather Online](https://developer.worldweatheronline.com/auth/register)

### Example

```
Lita.configure do |config|
  config.handlers.time.apikey = "abcdef1234567890fedcba0987654321"
end
```

## Usage

## Usage

You can look up the locale lime of a location using many diferent forms:

```
Lita: time Mableton, GA
Lita: time in Mableton, GA
Lita: what time in Mableton, GA
Lita: what time is it in Mableton, GA
```

The location names that supported by the API are:

* City and Town Names
* IP Address
* UK Postcode
* Canada Postal Code
* US Zipcode
* Aiport code (IATA)
* Latitude and Longitude (in decimal)

## Acknowledgements

* Mostly ~~stolen~~ inspired by the [Hubot time plugin](https://github.com/github/hubot-scripts/blob/master/src/scripts/time.coffee).
* Used the [Lita Google Images](https://github.com/jimmycuadra/lita-google-images) plugin as a template.

## License

[MIT](http://opensource.org/licenses/MIT)
