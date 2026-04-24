<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
class SuperAdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        $adminUser = User::updateOrCreate(
            ['email' => 'admin@grp.com'],
            [
                'name' => 'Super Admin',
                'email' => 'admin@grp.com',
                'email_verified_at' => now(),
                'password' => Hash::make('Admin@grp!'),
            ]
        );
    }
}
