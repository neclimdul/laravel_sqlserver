<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use App\User;

class UsersTableSeeder extends Seeder {

    public function run()
    {
        $faker = Faker::create();

        User::create([
            'name' => $faker->word,
            'email' => $faker->email,
            'password' => 'secret'
        ]);
    }

}