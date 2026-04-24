<?php

namespace App\Filament\Resources\ConfidenceToSells;

use App\Filament\Resources\ConfidenceToSells\Pages\CreateConfidenceToSell;
use App\Filament\Resources\ConfidenceToSells\Pages\EditConfidenceToSell;
use App\Filament\Resources\ConfidenceToSells\Pages\ListConfidenceToSells;
use App\Filament\Resources\ConfidenceToSells\Pages\ViewConfidenceToSell;
use App\Filament\Resources\ConfidenceToSells\Schemas\ConfidenceToSellForm;
use App\Filament\Resources\ConfidenceToSells\Schemas\ConfidenceToSellInfolist;
use App\Filament\Resources\ConfidenceToSells\Tables\ConfidenceToSellsTable;
use App\Models\ConfidenceToSell;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class ConfidenceToSellResource extends Resource
{
    protected static ?string $model = ConfidenceToSell::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'label';

    public static function form(Schema $schema): Schema
    {
        return ConfidenceToSellForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return ConfidenceToSellInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return ConfidenceToSellsTable::configure($table);
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
            'index' => ListConfidenceToSells::route('/'),
            'create' => CreateConfidenceToSell::route('/create'),
            'view' => ViewConfidenceToSell::route('/{record}'),
            'edit' => EditConfidenceToSell::route('/{record}/edit'),
        ];
    }
}
