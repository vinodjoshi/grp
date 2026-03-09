<?php

namespace App\Filament\Resources\TailoredActionPlans\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Schema;

class TailoredActionPlanForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('business_fit_option_id')
                    ->relationship('businessFitOption', 'title')
                    ->required(),
                Textarea::make('text')
                    ->required()
                    ->columnSpanFull(),
            ]);
    }
}
