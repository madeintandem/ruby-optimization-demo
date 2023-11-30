# frozen_string_literal: true

class StarDestroyerRater
  def rate(star_destroyer)
    rate_combat(star_destroyer)
    rate_interdiction(star_destroyer)
    rate_jump(star_destroyer)
  end

  private

  def rate_combat(star_destroyer)
    @result = 0.0

    29.times do
      @result += Math::tanh(star_destroyer.combat_rating_params.turbolasers * star_destroyer.combat_rating_params.ion_cannons)
    end
    9.times do
      @result *= Math::sinh(star_destroyer.combat_rating_params.tie_squadrons ** 3)
    end

    @result
  end

  def rate_interdiction(star_destroyer)
    @result = 0

    (star_destroyer.interdiction_rating_params.gravity_engines ** 3).times do
      @result *= Math::sinh(star_destroyer.interdiction_rating_params.max_mass_shadow) ** Math::exp(star_destroyer.interdiction_rating_params.power_drain)
    end

    @result
  end

  def rate_jump(star_destroyer)
    @result = 0

    23.times do
      @result += Math::hypot(star_destroyer.jump_rating_params.motivator_power, 1138.0)
    end
    31.times do
      @result *= Math::log2(star_destroyer.jump_rating_params.cronau_factor) * Math::log10(star_destroyer.jump_rating_params.mass_shadow)
    end

    @result
  end
end
