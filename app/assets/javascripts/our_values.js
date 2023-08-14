$(document).ready(function () {
  const initCoreValueFrameAnimations = () => {
    const coreValues = [
      ["partnership", "By fostering partnerships with ethical breeders, communities, shelters, and our fellow ethical rescues, we will create the changes that we want to see in the world."],
      ["accountability", "Holding ourselves and those around us in animal welfare accountable to a higher standard fosters transparency and inspires confidence within the rescue community."],
      ["trust", "Animal welfare organizations must work to regain the trust of the communities that they serve and support in the responsible placement of animals in homes."],
      ["respect", "Respect for one another, and respect between rescues and shelters, is vital if we are to present a united front in the face of the animal welfare crisis."],
      ["integrity", "If we are truly acting as a voice for the voiceless, striving to do right by them at all times - even when no one is watching - is paramount to behaving ethically in animal welfare."]
    ]
    for (const val of coreValues) {
      const coreValue = val[0];
      const statement = val[1];
      $(`.core-values-container, .${coreValue}`).mouseenter(function () {
        $(this).fadeTo(100, 0.8, function() {
          $(`#${coreValue}-first`).fadeOut(250, function() {
            $(this).removeClass("first-frame");
            $(this).addClass("second-frame");
            $(this).text(statement).fadeIn(250);
          });
        });
      });
      $(`.${coreValue}`).mouseleave(function () {
        $(this).fadeTo(100, 1.0, function() {
          $(`#${coreValue}-first`).fadeOut(250, function() {
            $(this).removeClass("second-frame");
            $(this).addClass("first-frame");
            $(this).text(coreValue.toUpperCase()).fadeIn(250);
          });
        });
      });

      // MOBILE
      $(`.core-values-container, .${coreValue}`).on("tap", function () {
        $(this).fadeTo(100, 0.8, function() {
          $(`#${coreValue}-first`).fadeOut(250, function() {
            $(this).removeClass("first-frame");
            $(this).addClass("second-frame");
            $(this).text(statement).fadeIn(250);
          });
        });
      });
      $(`.${coreValue}`).on("tap", function () {
        $(this).fadeTo(100, 1.0, function() {
          $(`#${coreValue}-first`).fadeOut(250, function() {
            $(this).removeClass("second-frame");
            $(this).addClass("first-frame");
            $(this).text(coreValue.toUpperCase()).fadeIn(250);
          });
        });
      });
    }
  }
  initCoreValueFrameAnimations();
});