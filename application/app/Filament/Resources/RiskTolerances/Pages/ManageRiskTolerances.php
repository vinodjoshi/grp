<?php

namespace App\Filament\Resources\RiskTolerances\Pages;

use App\Filament\Resources\RiskTolerances\RiskToleranceResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ManageRecords;

class ManageRiskTolerances extends ManageRecords
{
    protected static string $resource = RiskToleranceResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
