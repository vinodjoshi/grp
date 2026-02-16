<?php

namespace Database\Seeders;

use App\Models\TimeAvailability;
use Illuminate\Database\Seeder;

class TimeAvailabilitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $ranges = [
            ['label' => '<1h/day', 'min_hours_per_day' => 0, 'max_hours_per_day' => 1],
            ['label' => '1-3h/day', 'min_hours_per_day' => 1, 'max_hours_per_day' => 3],
            ['label' => '3-6h/day', 'min_hours_per_day' => 3, 'max_hours_per_day' => 6],
            ['label' => '6h+/day', 'min_hours_per_day' => 6, 'max_hours_per_day' => null],
        ];

        foreach ($ranges as $range) {
            TimeAvailability::query()->updateOrCreate(
                ['label' => $range['label']],
                $range
            );
        }
    }
}
