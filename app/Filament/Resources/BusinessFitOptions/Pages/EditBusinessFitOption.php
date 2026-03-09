<?php

namespace App\Filament\Resources\BusinessFitOptions\Pages;

use App\Filament\Resources\BusinessFitOptions\BusinessFitOptionResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditBusinessFitOption extends EditRecord
{
    protected static string $resource = BusinessFitOptionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
