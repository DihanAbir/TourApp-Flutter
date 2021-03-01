// http://localhost:5000/products/spondoreds/true

class Url {
  static final String api_endpoint = "http://192.168.0.9:5000/";
  static final String post_endpoint = api_endpoint + "products/";
  static final String newsfeed_endpoint = api_endpoint + "posts/";
  static final String sponsored_endpoint = post_endpoint + "spondoreds/true";
  static final String bus_endpoint = post_endpoint + "buses/Bus-Owner";
  static final String hotel_endpoint = post_endpoint + "hotels/Hotel-Owner";
}

