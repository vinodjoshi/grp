<?php

namespace App\Filament\Resources\BusinessFitOptions;

use App\Filament\Resources\BusinessFitOptions\Pages\CreateBusinessFitOption;
use App\Filament\Resources\BusinessFitOptions\Pages\EditBusinessFitOption;
use App\Filament\Resources\BusinessFitOptions\Pages\ListBusinessFitOptions;
use App\Filament\Resources\BusinessFitOptions\Schemas\BusinessFitOptionForm;
use App\Filament\Resources\BusinessFitOptions\Tables\BusinessFitOptionsTable;
use App\Models\BusinessFitOption;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class BusinessFitOptionResource extends Resource
{
    protected static ?string $model = BusinessFitOption::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'title';

    public static function form(Schema $schema): Schema
    {
        return BusinessFitOptionForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return BusinessFitOptionsTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListBusinessFitOptions::route('/'),
            'create' => CreateBusinessFitOption::route('/create'),
            'edit' => EditBusinessFitOption::route('/{record}/edit'),
        ];
    }
}
