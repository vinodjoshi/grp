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

    public function generateActionPlan(string $businessTitle, array $answers): array
    {
        $answersText = '';
        foreach ($answers as $questionNum => $answer) {
            $answersText .= "Question $questionNum: $answer\n";
        }

        $userPrompt = "
        The user is interested in starting a '$businessTitle' business.
        
        Here are their responses to an assessment questionnaire:
        $answersText
        
        Based on these responses, provide a comprehensive yet easy-to-understand tailored action plan and guide to get started in running this business.
        
        Include:
        1. Key skills and knowledge they need to develop
        2. Startup essentials and preparation steps
        3. Timeline for launch
        4. Essential tools or equipment needed
        5. First 30-day action items
        6. Recommended suppliers and vendors from South Africa (with specific names, types, and what they provide)
        7. Potential challenges and how to overcome them
        8. Tips for success
        9. Estimated initial investment range
        
        For suppliers, provide South African suppliers and vendors:
        - Supplier name or type (e.g., South African wholesale markets, local online platforms, SA-based manufacturers, regional distributors)
        - What they supply (materials, equipment, inventory, etc.)
        - Location or region in South Africa (e.g., Cape Town, Johannesburg, Durban, or nationwide)
        - Why they're recommended for this business
        - Approximate pricing in ZAR (South African Rand) or cost range if applicable
        - Contact information or where to find them (if known)
        
        Make it practical, encouraging, and specific to their answers and the South African business context.
        Format the response in a clear, well-structured way with sections and bullet points.
        ";

        $response = Http::withToken(env('OPENAI_API_KEY'))
            ->post('https://api.openai.com/v1/chat/completions', [
                'model' => 'gpt-4o-mini',
                'messages' => [
                    [
                        'role' => 'system',
                        'content' => '
                        You are an AI Business Coach providing expert, practical guidance for entrepreneurs in South Africa.
                        Provide helpful, structured, and encouraging advice with actionable recommendations.
                        Include specific South African supplier and vendor recommendations relevant to the business type.
                        Consider the South African business environment, regulations, and market conditions.
                        Provide pricing in South African Rand (ZAR) where applicable.
                        Format your response with clear sections using markdown-style formatting.
                        ',
                    ],
                    [
                        'role' => 'user',
                        'content' => $userPrompt,
                    ],
                ],
                'temperature' => 0.7,
                'max_tokens' => 3000,
            ]);

        if (! $response->successful()) {
            throw new \Exception('OpenAI request failed: '.$response->body());
        }

        $content = $response->json()['choices'][0]['message']['content'];

        return [
            'action_plan' => $content,
        ];
    }
}
