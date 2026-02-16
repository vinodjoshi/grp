<?php

namespace App\Filament\Resources\CapitalBands\Pages;

use App\Filament\Resources\CapitalBands\CapitalBandResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ManageRecords;

class ManageCapitalBands extends ManageRecords
{
    protected static string $resource = CapitalBandResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
