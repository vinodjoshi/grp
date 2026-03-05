<?php

namespace Database\Seeders;

use App\Models\Question;
use Illuminate\Database\Seeder;

class QuestionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        Question::query()->truncate();

        $questions = [

            // FINANCE
            ['category' => 'FINANCE', 'question' => 'Do you know exactly how much money you need to start your business?'],
            ['category' => 'FINANCE', 'question' => 'Do you calculate how much profit you make after paying for stock and expenses?'],
            ['category' => 'FINANCE', 'question' => 'Do you keep a daily record of money coming in and going out?'],
            ['category' => 'FINANCE', 'question' => 'Do you separate your business money from your personal money?'],
            ['category' => 'FINANCE', 'question' => 'If sales drop for 2 weeks, do you have backup savings to survive?'],

            // SALES
            ['category' => 'SALES', 'question' => 'Are you comfortable talking to strangers about your product?'],
            ['category' => 'SALES', 'question' => 'Do you know why customers choose your product instead of others?'],
            ['category' => 'SALES', 'question' => 'Do you ask customers for feedback after they buy?'],
            ['category' => 'SALES', 'question' => 'Do you try to sell more than one item to a customer (e.g., add-ons)?'],
            ['category' => 'SALES', 'question' => 'If customers say “it’s too expensive,” do you know how to respond?'],

            // OPERATIONS
            ['category' => 'OPERATIONS', 'question' => 'Do you have a fixed daily routine for your business?'],
            ['category' => 'OPERATIONS', 'question' => 'Do you check your stock before it runs out?'],
            ['category' => 'OPERATIONS', 'question' => 'Do you track how many products you sell each day?'],
            ['category' => 'OPERATIONS', 'question' => 'Do you prepare for busy times (e.g., weekends, payday)?'],
            ['category' => 'OPERATIONS', 'question' => 'If something goes wrong (equipment breaks, supplier late), do you have a backup plan?'],

            // MARKETING
            ['category' => 'MARKETING', 'question' => 'Do you actively promote your business every week?'],
            ['category' => 'MARKETING', 'question' => 'Do you know who your ideal customer is?'],
            ['category' => 'MARKETING', 'question' => 'Do customers easily see your business (signage, location, visibility)?'],
            ['category' => 'MARKETING', 'question' => 'Do you use WhatsApp, social media, or word-of-mouth to bring customers?'],
            ['category' => 'MARKETING', 'question' => 'Do you run small promotions or specials to attract attention?'],

            // RISKS
            ['category' => 'RISKS', 'question' => 'Have you identified what could cause your business to fail?'],
            ['category' => 'RISKS', 'question' => 'Do you have more than one supplier?'],
            ['category' => 'RISKS', 'question' => 'Are you prepared for price increases in stock?'],
            ['category' => 'RISKS', 'question' => 'Do you protect your equipment and stock from theft or damage?'],
            ['category' => 'RISKS', 'question' => 'Do you understand any local rules or permits needed?'],

            // EMPLOYEES
            ['category' => 'EMPLOYEES', 'question' => 'Have you ever managed someone before?'],
            ['category' => 'EMPLOYEES', 'question' => 'Do you know what tasks you would delegate first?'],
            ['category' => 'EMPLOYEES', 'question' => 'Do you have clear rules for staff (working hours, behaviour)?'],
            ['category' => 'EMPLOYEES', 'question' => 'Do you know how to calculate wages correctly?'],
            ['category' => 'EMPLOYEES', 'question' => 'If an employee performs badly, do you know how to handle it?'],
        ];

        foreach ($questions as $question) {
            Question::create($question);
        }
    }
}
