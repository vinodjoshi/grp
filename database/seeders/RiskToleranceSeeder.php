<?php

namespace Database\Seeders;

use App\Models\RiskTolerance;
use Illuminate\Database\Seeder;

class RiskToleranceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $levels = [
            ['label' => 'Low', 'level' => 1],
            ['label' => 'Medium', 'level' => 2],
            ['label' => 'High', 'level' => 3],
        ];

        foreach ($levels as $level) {
            RiskTolerance::query()->updateOrCreate(
                ['label' => $level['label']],
                $level
            );
        }
    }
}
