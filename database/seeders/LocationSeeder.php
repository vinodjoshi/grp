<?php

namespace Database\Seeders;

use App\Models\Location;
use Illuminate\Database\Seeder;

class LocationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $locations = [
            ['label' => 'Taxi Rank / Transport Hub', 'description' => 'High foot traffic transportation hubs'],
            ['label' => 'School / College Area', 'description' => 'Educational institutions and student areas'],
            ['label' => 'Residential Township / High-Density Housing', 'description' => 'Residential areas with high population density'],
            ['label' => 'Shopping Centre / Mall / Retail Strip', 'description' => 'Commercial retail areas and shopping districts'],
            ['label' => 'Industrial Area / Factories / Construction Site', 'description' => 'Industrial zones with manufacturing and construction'],
            ['label' => 'Clinic / Hospital / Government Office', 'description' => 'Healthcare and government service areas'],
            ['label' => 'Informal Market / Street Market', 'description' => 'Unstructured markets and street trading areas'],
            ['label' => 'Rural / Low Foot Traffic Area', 'description' => 'Rural areas with limited pedestrian traffic'],
        ];

        foreach ($locations as $location) {
            Location::query()->updateOrCreate(
                ['label' => $location['label']],
                $location
            );
        }
    }
}
