<?php

namespace App\Http\Controllers;

use App\Models\CapitalBand;
use App\Models\ConfidenceToSell;
use App\Models\Location;
use App\Models\RiskTolerance;
use App\Models\Skill;
use App\Models\TimeAvailability;
use App\Services\OpenAiService;
use Illuminate\Http\Request;

class IndexController extends Controller
{
    protected $openAi;

    public function __construct(OpenAiService $openAi)
    {
        $this->openAi = $openAi;
    }

    /**
     * Display the index page with all select options.
     */
    public function index()
    {
        $capitalBands = CapitalBand::query()->orderBy('min_amount')->get();
        $timeAvailabilities = TimeAvailability::query()->orderBy('min_hours_per_day')->get();
        $skills = Skill::query()->orderBy('label')->get();
        $riskTolerances = RiskTolerance::query()->orderBy('level')->get();
        $confidenceToSells = ConfidenceToSell::query()->orderBy('level')->get();
        $locations = Location::query()->orderBy('label')->get();

        return view('index', compact(
            'capitalBands',
            'timeAvailabilities',
            'skills',
            'riskTolerances',
            'confidenceToSells',
            'locations'
        ));
    }

    public function recommend(Request $request)
    {
        $request->validate([
            'capital_band' => 'required|string',
            'time_availability' => 'required|string',
            'skills' => 'array',
            'risk_tolerance' => 'required|string',
            'confidence_to_sell' => 'required|string',
            'location' => 'required|string',
            'assets' => 'array',
        ]);

        try {
            $result = $this->openAi->getBusinessRecommendations($request->all());

            return response()->json([
                'success' => true,
                'data' => $result,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}
