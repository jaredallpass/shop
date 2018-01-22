Spree.ready(function($) {
  Spree.addImageHandlers = function() {
    var thumbnails = $("#product-images div.thumbnails");
    $("#main-image").data("selectedThumb", $("#main-image img").attr("src"));
    if (!thumbnails.find("div.selected").length) {
      thumbnails
        .find("div")
        .eq(0)
        .addClass("selected");
    }
    thumbnails.find("a").on("click", function(event) {
      $("#main-image").data(
        "selectedThumb",
        $(event.currentTarget).attr("href")
      );
      $("#main-image").data(
        "selectedThumbId",
        $(event.currentTarget)
          .parent()
          .attr("id")
      );
      thumbnails.find("div").removeClass("selected");
      $(event.currentTarget)
        .parent("div")
        .addClass("selected");
      return false;
    });
    thumbnails.find("div").on("mouseenter", function(event) {
      $("#main-image img").attr(
        "src",
        $(event.currentTarget)
          .find("a")
          .attr("href")
      );
    });
    thumbnails.find("div").on("mouseleave", function(event) {
      $("#main-image img").attr("src", $("#main-image").data("selectedThumb"));
    });
  };

  Spree.showVariantImages = function(variantId) {
    $("div.vtmb").hide();
    $("div.tmb-" + variantId).show();
    var currentThumb = $("#" + $("#main-image").data("selectedThumbId"));
    if (!currentThumb.hasClass("vtmb-" + variantId)) {
      var thumb = $($("#product-images div.thumbnails div:visible.vtmb").eq(0));
      if (!(thumb.length > 0)) {
        thumb = $($("#product-images div.thumbnails div:visible").eq(0));
      }
      var newImg = thumb.find("a").attr("href");
      $("#product-images div.thumbnails div").removeClass("selected");
      thumb.addClass("selected");
      $("#main-image img").attr("src", newImg);
      $("#main-image").data("selectedThumb", newImg);
      $("#main-image").data("selectedThumbId", thumb.attr("id"));
    }
  };

  Spree.updateVariantPrice = function(variant) {
    var variantPrice = variant.data("price");
    if (variantPrice) {
      $(".price.selling").text(variantPrice);
    }
  };

  var radios = $('#product-variants input[type="radio"]');
  if (radios.length > 0) {
    var selectedRadio = $(
      '#product-variants input[type="radio"][checked="checked"]'
    );
    Spree.showVariantImages(selectedRadio.attr("value"));
    Spree.updateVariantPrice(selectedRadio);
  }

  Spree.addImageHandlers();

  radios.click(function(event) {
    Spree.showVariantImages(this.value);
    Spree.updateVariantPrice($(this));
  });
});
