<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class OpenAiService
{
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

        $response = Http::withToken(env('OPENAI_API_KEY'))
            ->post('https://api.openai.com/v1/chat/completions', [
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

        if (! $response->successful()) {
            throw new \Exception('OpenAI request failed: '.$response->body());
        }

        $content = $response->json()['choices'][0]['message']['content'];

        return json_decode($content, true);
    }

    public function generateQuestionsForBusiness(string $businessTitle): array
    {
        $userPrompt = "
        Generate 20 easy-to-understand assessment questions for someone considering to start a '$businessTitle' business.
        
        These questions should help them assess their knowledge, readiness, and understanding of what's needed to start and run this business.
        Focus on practical aspects like: skills needed, initial setup, daily operations, costs, customer acquisition, time commitment, challenges, etc.
        
        Questions should be simple, clear, and answerable with straightforward responses.
        ";

        $response = Http::withToken(env('OPENAI_API_KEY'))
            ->post('https://api.openai.com/v1/chat/completions', [
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

        if (! $response->successful()) {
            throw new \Exception('OpenAI request failed: '.$response->body());
        }

        $content = $response->json()['choices'][0]['message']['content'];

        return json_decode($content, true);
    }
}
