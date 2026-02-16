<?php

namespace Database\Seeders;

use App\Models\Skill;
use Illuminate\Database\Seeder;

class SkillSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $skills = [
            'Cooking',
            'Sales',
            'Repairs',
            'Hair',
            'Admin',
            'Sourcing',
        ];

        foreach ($skills as $label) {
            Skill::query()->updateOrCreate(
                ['label' => $label],
                ['label' => $label]
            );
        }
    }
}
