<?php

namespace App\Http\Controllers;

use App\Models\CapitalBand;
use App\Models\BusinessFitOption;
use App\Models\ConfidenceToSell;
use App\Models\Location;
use App\Models\Question;
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
            'user_address' => 'nullable|string',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
            'formatted_address' => 'nullable|string',
        ]);

        try {
            $options = BusinessFitOption::query()
                ->orderBy('title')
                ->get(['id', 'title', 'text']);

            return response()->json([
                'success' => true,
                'data' => [
                    'options' => $options,
                ],
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Display questions for the selected business option.
     */
    public function questions()
    {
        return view('questions');
    }

    /**
     * Generate assessment questions for a specific business using AI.
     */
    public function generateQuestions(Request $request)
    {
        $request->validate([
            'business_title' => 'required|string|max:255',
        ]);

        try {
            // Get AI-generated questions
            $aiResult = $this->openAi->generateQuestionsForBusiness($request->input('business_title'));

            // Fetch 2 questions from each of 5 categories from the database
            $categories = ['FINANCE', 'SALES', 'OPERATIONS', 'MARKETING', 'RISKS'];
            $databaseQuestions = [];

            foreach ($categories as $category) {
                $questions = Question::query()
                    ->where('category', $category)
                    ->inRandomOrder()
                    ->limit(2)
                    ->get(['id', 'question', 'category']);

                foreach ($questions as $question) {
                    $databaseQuestions[] = [
                        'id' => $question->id,
                        'question' => $question->question,
                        'category' => $question->category,
                        'options' => ['Yes', 'No', 'NA'],
                        'source' => 'database',
                    ];
                }
            }

            return response()->json([
                'success' => true,
                'data' => [
                    'ai_questions' => $aiResult['questions'] ?? [],
                    'database_questions' => $databaseQuestions,
                ],
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Generate a tailored action plan based on user responses.
     */
    public function generateActionPlan(Request $request)
    {
        $request->validate([
            'business_title' => 'required|string|max:255',
            'answers' => 'required|array',
            'user_location' => 'nullable|string',
        ]);

        try {
            $result = $this->openAi->generateActionPlan(
                $request->input('business_title'),
                $request->input('answers'),
                $request->input('user_location', 'South Africa')
            );

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
