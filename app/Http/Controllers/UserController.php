<?php

namespace App\Http\Controllers;

class UserController extends Controller
{
	public function show(\App\User $user) {
		return $user;
	}
}
