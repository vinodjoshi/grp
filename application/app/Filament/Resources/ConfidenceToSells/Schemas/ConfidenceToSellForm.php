<?php

namespace App\Filament\Resources\ConfidenceToSells\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class ConfidenceToSellForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('label')
                    ->required(),
                TextInput::make('level')
                    ->required()
                    ->numeric(),
            ]);
    }
}
