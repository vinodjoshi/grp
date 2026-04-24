<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TimeAvailability extends Model
{
    /** @use HasFactory<\Database\Factories\TimeAvailabilityFactory> */
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'label',
        'min_hours_per_day',
        'max_hours_per_day',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'min_hours_per_day' => 'decimal:2',
            'max_hours_per_day' => 'decimal:2',
        ];
    }
}
