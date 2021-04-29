(function () {
  var id, url;

  url = window.location.href;

  id = url.slice(url.length - 1, url.length);

  console.log(id);

  App.cookiestatus = App.cable.subscriptions.create(
    {
      channel: "OvenStatusChannel",
      id: id,
    },
    {
      connected: function () {
        return console.log("Connected to the OvenStatus channel!");
      },
      disconnected: function () {},
      received: function (data) {
        console.log(data);
        return $(".oven_status").html(data["status"]);
      },
    }
  );
}.call(this));
