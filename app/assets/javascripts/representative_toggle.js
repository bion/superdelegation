function RepresentativeToggle() {
  function toggleRep(e) {
    var targetRep = $(this);

    $('.representative')
      .not(targetRep)
      .attr('checked', false);
  };

  $('.representative').click(toggleRep);
}
