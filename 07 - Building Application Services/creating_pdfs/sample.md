<style>
  h1 { font-size: 20pt; }
  p  { font-size: 14pt; }
  .centered { text-align: center; }
</style>

<h1 class="centered">
CoffeeScript Application Developers Cookbook
</h1>

<p class="centered">
![CoffeeScript logo](/templates/images/logo.png "CoffeeScript Logo")

__Base64__-encoding allows us to transform binary data into text data.
The reasons for this are rooted in the history of network
protocols, but it is still a widely-used form of encoding when
shipping binary data.

Node provides a string Buffer class that is able to represent text
data in a variety of encodings including ASCII, UTF-8 and Base-64.
This Buffer class will be the core of our conversion operations.