<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        $this->call([
            CapitalBandSeeder::class,
            TimeAvailabilitySeeder::class,
            SkillSeeder::class,
            RiskToleranceSeeder::class,
            ConfidenceToSellSeeder::class,
            LocationSeeder::class,
            SuperAdminSeeder::class,
        ]);
    }
}
