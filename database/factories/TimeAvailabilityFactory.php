<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\TimeAvailability>
 */
class TimeAvailabilityFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $min = $this->faker->numberBetween(0, 6);
        $max = $this->faker->optional(0.3)->numberBetween($min + 1, $min + 8);

        return [
            'label' => $max === null
                ? $min . 'h+/day'
                : $min . '-' . $max . 'h/day',
            'min_hours_per_day' => $min,
            'max_hours_per_day' => $max,
        ];
    }
}
