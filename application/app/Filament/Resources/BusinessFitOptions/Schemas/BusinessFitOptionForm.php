<?php

namespace App\Filament\Resources\BusinessFitOptions\Schemas;

use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class BusinessFitOptionForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('title')
                    ->required(),
                RichEditor::make('text')
                    ->required()
                    ->extraInputAttributes(['class' => 'min-h-64'])
                    ->columnSpanFull(),
            ]);
    }
}
