<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class OpenAiService
{
    private const API_TIMEOUT = 60;
    private const RETRY_ATTEMPTS = 3;
    private const RETRY_DELAY = 1000; // milliseconds

    public function getBusinessRecommendations(array $profileData)
    {
        $userPrompt = "
        Here is the user's profile:

        Capital Band: {$profileData['capital_band']}
        Time Availability: {$profileData['time_availability']}
        Skills: ".implode(', ', $profileData['skills'] ?? [])."
        Risk Tolerance: {$profileData['risk_tolerance']}
        Confidence to Sell: {$profileData['confidence_to_sell']}
        Location: {$profileData['location']}
        Assets: ".implode(', ', $profileData['assets'] ?? []).'

        Suggest 5 best matching small business ideas.
        ';

        try {
            $response = $this->makeOpenAiRequest([
                'model' => 'gpt-4o-mini',
                'messages' => [
                    [
                        'role' => 'system',
                        'content' => '
                        You are an AI Business Coach.
                        Return response in valid JSON only.

                        Structure:
                        {
                          "options": [
                            {
                              "title": "",
                              "subtype_id": "",
                              "why_it_fits": [],
                              "operating_model": "",
                              "complexity": "",
                              "risk_band": "",
                              "capital_fit": "",
                              "confidence_reason": ""
                            }
                          ]
                        }
                        ',
                    ],
                    [
                        'role' => 'user',
                        'content' => $userPrompt,
                    ],
                ],
                'temperature' => 0.7,
                'response_format' => [
                    'type' => 'json_object',
                ],
                'max_tokens' => 800,
            ]);

            $content = $response->json()['choices'][0]['message']['content'];

            return json_decode($content, true);
        } catch (\Exception $e) {
            Log::error('OpenAI getBusinessRecommendations error: ' . $e->getMessage());
            throw new \Exception('Failed to get business recommendations. Please try again. Error: ' . $e->getMessage());
        }
    }

    public function generateQuestionsForBusiness(string $businessTitle): array
    {
        $userPrompt = "
        Generate 10 easy-to-understand assessment questions for someone considering to start a '$businessTitle' business.
        
        These questions should help them assess their knowledge, readiness, and understanding of what's needed to start and run this business.
        Focus on practical aspects like: skills needed, initial setup, daily operations, costs, customer acquisition, time commitment, challenges, etc.
        
        Questions should be simple, clear, and answerable with straightforward responses.
        ";

        try {
            $response = $this->makeOpenAiRequest([
                'model' => 'gpt-4o-mini',
                'messages' => [
                    [
                        'role' => 'system',
                        'content' => '
                        You are an AI Business Education Expert.
                        Return response in valid JSON only.

                        Structure:
                        {
                          "questions": [
                            {
                              "question": "question text here",
                              "options": ["option 1", "option 2", "option 3", "option 4"]
                            }
                          ]
                        }
                        ',
                    ],
                    [
                        'role' => 'user',
                        'content' => $userPrompt,
                    ],
                ],
                'temperature' => 0.7,
                'response_format' => [
                    'type' => 'json_object',
                ],
                'max_tokens' => 2000,
            ]);

            $content = $response->json()['choices'][0]['message']['content'];

            return json_decode($content, true);
        } catch (\Exception $e) {
            Log::error('OpenAI generateQuestionsForBusiness error: ' . $e->getMessage());
            throw new \Exception('Failed to generate questions. Please try again. Error: ' . $e->getMessage());
        }
    }

    public function generateActionPlan(string $businessTitle, array $answers, string $userLocation = 'South Africa'): array
    {
        $answersText = '';
        foreach ($answers as $questionNum => $answer) {
            $answersText .= "Question $questionNum: $answer\n";
        }

        // Extract country/region from location
        $locationParts = explode(',', $userLocation);
        $country = trim(end($locationParts));
        
        // Determine currency based on location
        $currency = $this->getCurrencyForLocation($country);
        
        $userPrompt = "
        The user is interested in starting a '$businessTitle' business.
        
        Their location: $userLocation
        
        Here are their responses to an assessment questionnaire:
        $answersText
        
        Based on these responses, provide a comprehensive yet easy-to-understand tailored action plan and guide to get started in running this business.
        
        Include:
        1. Key skills and knowledge they need to develop
        2. Startup essentials and preparation steps
        3. Timeline for launch
        4. Essential tools or equipment needed
        5. First 30-day action items
        6. Recommended suppliers and vendors from $country (with specific names, types, and what they provide)
        7. Estimated probability of success as a percentage (0-100%) for the first 12 months, with a short explanation of assumptions and the top local challenges
        
        For suppliers, provide local suppliers and vendors in $country:
        - Supplier name or type (e.g., local wholesale markets, online platforms, manufacturers, regional distributors)
        - What they supply (materials, equipment, inventory, etc.)
        - Location or region (specific cities or nationwide)
        - Why they're recommended for this business
        - Approximate pricing in $currency or cost range if applicable
        - Contact information or where to find them (if known)
        
        Make it practical, encouraging, and specific to their answers and the local business context in $userLocation.
        For the success estimate, do not use vague words only (like high/medium/low). You must provide a numeric percentage.
        Add a section exactly titled: `Success Probability (12 Months)` and include:
        - Estimated success probability: X%
        - Confidence level: Low, Medium, or High
        - Assumptions used for this estimate
        - Top 3 local challenges that could lower this probability
        Format the response in a clear, well-structured way with sections and bullet points.
        ";

        try {
            $response = $this->makeOpenAiRequest([
                'model' => 'gpt-4o-mini',
                'messages' => [
                    [
                        'role' => 'system',
                        'content' => "
                        You are an AI Business Coach providing expert, practical guidance for entrepreneurs in $userLocation.
                        Provide helpful, structured, and encouraging advice with actionable recommendations.
                        Include specific local supplier and vendor recommendations relevant to the business type and location.
                        Consider the local business environment, regulations, and market conditions.
                        Provide pricing in $currency where applicable.
                        Format your response with clear sections using markdown-style formatting.
                        ",
                    ],
                    [
                        'role' => 'user',
                        'content' => $userPrompt,
                    ],
                ],
                'temperature' => 0.7,
                'max_tokens' => 3000,
            ]);

            $content = $response->json()['choices'][0]['message']['content'];

            return [
                'action_plan' => $content,
            ];
        } catch (\Exception $e) {
            Log::error('OpenAI generateActionPlan error: ' . $e->getMessage());
            throw new \Exception('Failed to generate action plan. Please try again. Error: ' . $e->getMessage());
        }
    }

    /**
     * Make OpenAI API request with retry logic and timeout handling
     */
    private function makeOpenAiRequest(array $payload)
    {
        $lastException = null;
        
        for ($attempt = 1; $attempt <= self::RETRY_ATTEMPTS; $attempt++) {
            try {
                $response = Http::withToken(env('OPENAI_API_KEY'))
                    ->timeout(self::API_TIMEOUT)
                    ->post('https://api.openai.com/v1/chat/completions', $payload);

                if ($response->successful()) {
                    return $response;
                }

                // Handle non-successful response
                $statusCode = $response->status();
                $body = $response->body();
                
                // Log the error
                Log::warning("OpenAI API error - Attempt $attempt: Status $statusCode, Body: $body");
                
                // If it's a 429 (rate limit) or 5xx error, retry
                if ($statusCode === 429 || $statusCode >= 500) {
                    if ($attempt < self::RETRY_ATTEMPTS) {
                        sleep($attempt); // Exponential backoff
                        continue;
                    }
                }
                
                throw new \Exception("OpenAI API error (HTTP $statusCode): $body");
            } catch (\Illuminate\Http\Client\ConnectionException $e) {
                // Network error - retry
                $lastException = $e;
                Log::warning("OpenAI connection error - Attempt $attempt: " . $e->getMessage());
                
                if ($attempt < self::RETRY_ATTEMPTS) {
                    sleep($attempt); // Exponential backoff
                    continue;
                }
                
                throw new \Exception("Network error connecting to OpenAI API: " . $e->getMessage());
            } catch (\Exception $e) {
                $lastException = $e;
                Log::error("OpenAI request error - Attempt $attempt: " . $e->getMessage());
                
                if ($attempt < self::RETRY_ATTEMPTS) {
                    sleep($attempt);
                    continue;
                }
                
                throw $e;
            }
        }
        
        throw new \Exception("OpenAI API request failed after " . self::RETRY_ATTEMPTS . " attempts. Last error: " . ($lastException ? $lastException->getMessage() : 'Unknown error'));
    }

    /**
     * Get currency for a given location/country
     */
    private function getCurrencyForLocation(string $country): string
    {
        $currencies = [
            'South Africa' => 'ZAR (South African Rand)',
            'United States' => 'USD',
            'United Kingdom' => 'GBP',
            'India' => 'INR',
            'Kenya' => 'KES',
            'Nigeria' => 'NGN',
            'Ghana' => 'GHS',
            'Zimbabwe' => 'USD',
        ];

        return $currencies[$country] ?? 'local currency';
    }
}
