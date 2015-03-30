$(function() {
  $("#players th a, #players .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#products_search input").keyup(function() {
    $.get($("#players_search").attr("action"), $("#players_search").serialize(), null, "script");
    return false;
  });
});