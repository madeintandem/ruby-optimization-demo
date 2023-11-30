# frozen_string_literal: true

class StarDestroyerRater
  def initialize
    load_rating_params
  end

  def rate(star_destroyer)
    rate_combat(star_destroyer)
    rate_interdiction(star_destroyer)
    rate_jump(star_destroyer)

    star_destroyer.save
  end

  private

  def load_rating_params
    @rating_params = StarDestroyer::CLASSES.map do |klass|
      [klass.to_sym, {}]
    end.to_h

    CombatRatingParam.all.each do |rating_params|
      @rating_params[rating_params.star_destroyer_version.to_sym][:combat] = {
        tie_squadrons: rating_params.tie_squadrons,
        turbolasers: rating_params.turbolasers,
        ion_cannons: rating_params.ion_cannons
      }
    end

    InterdictionRatingParam.all.each do |rating_params|
      @rating_params[rating_params.star_destroyer_version.to_sym][:interdiction] = {
        gravity_engines: rating_params.gravity_engines,
        max_mass_shadow: rating_params.max_mass_shadow,
        power_drain: rating_params.power_drain
      }
    end

    JumpRatingParam.all.each do |rating_params|
      @rating_params[rating_params.star_destroyer_version.to_sym][:jump] = {
        motivator_power: rating_params.motivator_power,
        cronau_factor: rating_params.cronau_factor,
        mass_shadow: rating_params.mass_shadow
      }
    end
  end

  def rate_combat(star_destroyer)
    result = 0.0

    rating_params = @rating_params[star_destroyer.version.to_sym][:combat]

    29.times do
      result += Math::tanh(rating_params[:turbolasers] * rating_params[:ion_cannons])
    end
    9.times do
      result *= Math::sinh(rating_params[:tie_squadrons] ** 3)
    end

    star_destroyer.combat_rating = result
  end

  def rate_interdiction(star_destroyer)
    result = 0

    rating_params = @rating_params[star_destroyer.version.to_sym][:interdiction]

    (rating_params[:gravity_engines] ** 3).times do
      result *= Math::sinh(rating_params[:max_mass_shadow]) ** Math::exp(rating_params[:power_drain])
    end

    star_destroyer.interdiction_rating = result
  end

  def rate_jump(star_destroyer)
    result = 0

    rating_params = @rating_params[star_destroyer.version.to_sym][:jump]

    23.times do
      result += Math::hypot(rating_params[:motivator_power], 1138.0)
    end
    31.times do
      result *= Math::log2(rating_params[:cronau_factor]) * Math::log10(rating_params[:mass_shadow])
    end

    star_destroyer.jump_rating = result
  end
end
