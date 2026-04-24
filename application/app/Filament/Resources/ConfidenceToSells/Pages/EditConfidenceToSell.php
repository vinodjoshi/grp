<?php

namespace App\Filament\Resources\ConfidenceToSells\Pages;

use App\Filament\Resources\ConfidenceToSells\ConfidenceToSellResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ViewAction;
use Filament\Resources\Pages\EditRecord;

class EditConfidenceToSell extends EditRecord
{
    protected static string $resource = ConfidenceToSellResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),
            DeleteAction::make(),
        ];
    }
}
