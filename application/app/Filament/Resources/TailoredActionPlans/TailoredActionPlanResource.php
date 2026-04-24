<?php

namespace App\Filament\Resources\TailoredActionPlans;

use App\Filament\Resources\TailoredActionPlans\Pages\CreateTailoredActionPlan;
use App\Filament\Resources\TailoredActionPlans\Pages\EditTailoredActionPlan;
use App\Filament\Resources\TailoredActionPlans\Pages\ListTailoredActionPlans;
use App\Filament\Resources\TailoredActionPlans\Schemas\TailoredActionPlanForm;
use App\Filament\Resources\TailoredActionPlans\Tables\TailoredActionPlansTable;
use App\Models\TailoredActionPlan;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class TailoredActionPlanResource extends Resource
{
    protected static ?string $model = TailoredActionPlan::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'option';

    protected static ?int $navigationSort = 20;

    public static function form(Schema $schema): Schema
    {
        return TailoredActionPlanForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return TailoredActionPlansTable::configure($table);
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
            'index' => ListTailoredActionPlans::route('/'),
            'create' => CreateTailoredActionPlan::route('/create'),
            'edit' => EditTailoredActionPlan::route('/{record}/edit'),
        ];
    }
}
