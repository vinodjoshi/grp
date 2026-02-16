<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\CapitalBand;
use App\Models\RiskTolerance;
use App\Models\Skill;
use App\Models\TimeAvailability;
use Illuminate\Http\JsonResponse;

class OptionController extends Controller
{
    /**
     * Get all capital band options.
     */
    public function capitalBands(): JsonResponse
    {
        $capitalBands = CapitalBand::query()
            ->orderBy('min_amount')
            ->get();

        return response()->json($capitalBands);
    }

    /**
     * Get all time availability options.
     */
    public function timeAvailabilities(): JsonResponse
    {
        $timeAvailabilities = TimeAvailability::query()
            ->orderBy('min_hours_per_day')
            ->get();

        return response()->json($timeAvailabilities);
    }

    /**
     * Get all skill options.
     */
    public function skills(): JsonResponse
    {
        $skills = Skill::query()
            ->orderBy('label')
            ->get();

        return response()->json($skills);
    }

    /**
     * Get all risk tolerance options.
     */
    public function riskTolerances(): JsonResponse
    {
        $riskTolerances = RiskTolerance::query()
            ->orderBy('level')
            ->get();

        return response()->json($riskTolerances);
    }

    /**
     * Get all options in a single response.
     */
    public function all(): JsonResponse
    {
        return response()->json([
            'capital_bands' => CapitalBand::query()->orderBy('min_amount')->get(),
            'time_availabilities' => TimeAvailability::query()->orderBy('min_hours_per_day')->get(),
            'skills' => Skill::query()->orderBy('label')->get(),
            'risk_tolerances' => RiskTolerance::query()->orderBy('level')->get(),
        ]);
    }
}
