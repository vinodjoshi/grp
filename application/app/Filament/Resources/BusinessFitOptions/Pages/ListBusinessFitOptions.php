<?php

namespace App\Filament\Resources\BusinessFitOptions\Pages;

use App\Filament\Resources\BusinessFitOptions\BusinessFitOptionResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListBusinessFitOptions extends ListRecords
{
    protected static string $resource = BusinessFitOptionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
