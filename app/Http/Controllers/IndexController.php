<?php

namespace App\Http\Controllers;

use App\Models\CapitalBand;
use App\Models\RiskTolerance;
use App\Models\Skill;
use App\Models\TimeAvailability;

class IndexController extends Controller
{
    /**
     * Display the index page with all select options.
     */
    public function index()
    {
        $capitalBands = CapitalBand::query()->orderBy('min_amount')->get();
        $timeAvailabilities = TimeAvailability::query()->orderBy('min_hours_per_day')->get();
        $skills = Skill::query()->orderBy('label')->get();
        $riskTolerances = RiskTolerance::query()->orderBy('level')->get();

        return view('index', compact(
            'capitalBands',
            'timeAvailabilities',
            'skills',
            'riskTolerances'
        ));
    }
}
