<?php

namespace App\Filament\Resources\TimeAvailabilities\Pages;

use App\Filament\Resources\TimeAvailabilities\TimeAvailabilityResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ManageRecords;

class ManageTimeAvailabilities extends ManageRecords
{
    protected static string $resource = TimeAvailabilityResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
