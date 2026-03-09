<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class BusinessFitOption extends Model
{
    /** @use HasFactory<\Database\Factories\BusinessFitOptionFactory> */
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'title',
        'text',
    ];

    public function tailoredActionPlans(): HasMany
    {
        return $this->hasMany(TailoredActionPlan::class);
    }
}
