<?php

namespace App\Filament\Resources\ConfidenceToSells\Pages;

use App\Filament\Resources\ConfidenceToSells\ConfidenceToSellResource;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewConfidenceToSell extends ViewRecord
{
    protected static string $resource = ConfidenceToSellResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make(),
        ];
    }
}
