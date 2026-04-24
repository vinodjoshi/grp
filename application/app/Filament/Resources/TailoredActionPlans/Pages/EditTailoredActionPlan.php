<?php

namespace App\Filament\Resources\TailoredActionPlans\Pages;

use App\Filament\Resources\TailoredActionPlans\TailoredActionPlanResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditTailoredActionPlan extends EditRecord
{
    protected static string $resource = TailoredActionPlanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
