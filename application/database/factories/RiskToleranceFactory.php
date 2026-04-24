<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\RiskTolerance>
 */
class RiskToleranceFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $labels = [
            'Low' => 1,
            'Medium' => 2,
            'High' => 3,
        ];
        $label = $this->faker->randomElement(array_keys($labels));

        return [
            'label' => $label,
            'level' => $labels[$label],
        ];
    }
}
