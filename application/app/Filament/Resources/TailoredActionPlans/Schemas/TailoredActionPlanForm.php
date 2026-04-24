<?php

namespace App\Filament\Resources\TailoredActionPlans\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\RichEditor;
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
                RichEditor::make('text')
                    ->required()
                    ->extraInputAttributes(['class' => 'min-h-64'])
                    ->columnSpanFull(),
            ]);
    }
}
