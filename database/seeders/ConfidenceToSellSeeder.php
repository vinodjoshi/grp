<?php

namespace Database\Seeders;

use App\Models\ConfidenceToSell;
use Illuminate\Database\Seeder;

class ConfidenceToSellSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $levels = [
            ['label' => 'Very Low', 'level' => 1],
            ['label' => 'Low', 'level' => 2],
            ['label' => 'Medium', 'level' => 3],
            ['label' => 'High', 'level' => 4],
            ['label' => 'Very High', 'level' => 5],
        ];

        foreach ($levels as $level) {
            ConfidenceToSell::query()->updateOrCreate(
                ['label' => $level['label']],
                $level
            );
        }
    }
}
