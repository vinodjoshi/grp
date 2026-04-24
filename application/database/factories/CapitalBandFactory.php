<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\CapitalBand>
 */
class CapitalBandFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $min = $this->faker->numberBetween(0, 5000);
        $max = $this->faker->optional(0.3)->numberBetween($min + 1, $min + 10000);

        return [
            'label' => $max === null ? 'R' . $min . '+' : 'R' . $min . '-R' . $max,
            'min_amount' => $min,
            'max_amount' => $max,
        ];
    }
}
