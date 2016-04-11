<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;

class RegistrationController extends Controller
{

    public function registerUser(Request $request){

        $expectedInput = $request->only('name','email','password','phone_number');
        $rules = [
            'name' => 'required|string|max:25',
            'email' => 'required|email',
            'password' => 'required|alpha_num',
            'phone_number' => 'phone:AUTO,MY,MOBILE'
        ];
        $validation = Validator::make($expectedInput, $rules);

        if($validation->passes()){

            return 'PERFORM YOUR BUSINESS LOGIC HERE';

        }else{

//            return $validation->messages();
            return app_path().'/core/Domain';

        }

    }
}
