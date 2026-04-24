<?php

namespace App\Filament\Resources\ConfidenceToSells\Pages;

use App\Filament\Resources\ConfidenceToSells\ConfidenceToSellResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListConfidenceToSells extends ListRecords
{
    protected static string $resource = ConfidenceToSellResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
