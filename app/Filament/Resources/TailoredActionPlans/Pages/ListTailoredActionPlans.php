<?php

namespace App\Filament\Resources\TailoredActionPlans\Pages;

use App\Filament\Resources\TailoredActionPlans\TailoredActionPlanResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListTailoredActionPlans extends ListRecords
{
    protected static string $resource = TailoredActionPlanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
