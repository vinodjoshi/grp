<?php

namespace Database\Seeders;

use App\Models\CapitalBand;
use Illuminate\Database\Seeder;

class CapitalBandSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $bands = [
            ['label' => 'R0-R500', 'min_amount' => 0, 'max_amount' => 500],
            ['label' => 'R500-R2000', 'min_amount' => 500, 'max_amount' => 2000],
            ['label' => 'R2000-R5000', 'min_amount' => 2000, 'max_amount' => 5000],
            ['label' => 'R5000+', 'min_amount' => 5000, 'max_amount' => null],
        ];

        foreach ($bands as $band) {
            CapitalBand::query()->updateOrCreate(
                ['label' => $band['label']],
                $band
            );
        }
    }
}
