<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Str;


use Illuminate\Http\Request;


class AuthController extends Controller
{
    // This function will redirect user to the google login page
    public function redirectToGoogle(){
        return Socialite::driver('google')->redirect();
    }

    // This function will handle and store the google login data in the database
    public function handleGoogleCallback(){
    try {
            $googleUser = Socialite::driver('google')->user();

            // Checking by Google ID in our database
            $user = User::where('google_id', $googleUser->id)->first();

            // Creating record if doesn't exist
            if (!$user) {
                $user = User::firstOrCreate(
                    ['email' => $googleUser->email],
                    [
                        // Assigning name from google in our table
                        'name' => $googleUser->name,
                        // Generate random password
                        'password' => Hash::make(Str::random(16)),
                        // Assigning google id in our table
                        'google_id' => $googleUser->id,
                    ]
                );
            }

            // Creating Sanctum token
            $token = $user->createToken('api-token')->plainTextToken;
            // Returning to with token
            return response()->json(['api-token' => $token]);

        } catch (\Exception $e) {
            // Incase of any error occured while google login
            return response()->json(['message' => 'Google login error: ' . $e->getMessage()], 500);
        }
    }

    // This function will be responsible to register new user to our app
    public function register(Request $request){

        // Validating all the input of the register with type and required field
        $validate = Validator::make($request->all(), [
            'name'=> 'required|max:255',
            'email' => 'email|required',
            'password' => 'regex:/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/|required',
            'confirm-password' => 'same:password',
        ]);

        // Checking if validation fails. In case of failing it will send the errors
        if($validate->fails()){
            return response()->json([
                'message'=>'validation error',
                'errors'=> $validate->errors()
            ], 400);
        }

        // Creating and assigning values to the user table
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        // Generating api-token for the user
        $token = $user->createToken('api-token')->plainTextToken;

        // Returning to with token and message
        return response()->json(['token' => $token, 'message' => 'Sucessfully Registered'], 201);
    }

    // For Test Case
    public function loginPage(Request $request){
        return response()->json("This is login Page");
    }


    // This function will be responsible for login user to our app
    public function login(Request $request){

        // Validating all the input of the login with type and required field
        $validate = Validator::make($request->all(), [
            'email' => 'string|required|email',
            'password' => 'required',
        ]);

        // Checking if validation fails. In case of failing it will send the errors
        if($validate->fails()){
            return response()->json([
                'message'=>'validation error',
                'errors'=> $validate->errors()
            ], 400);
        }

        // Finding user in our database
        $user = User::where('email', $request->email)->first();

        // Checking if user email exist in database or not.
        if(empty($user)){
            // If user is not found, it will return message with the email error.
            return response()->json(['message'=> 'Email doesn\'t match.'], 401);
        }
        else{
            // If user exist, checking password of the user using Hash
            if(Hash::check($request->input('password'), $user->password)){
                // If password is matched, returing with login in success message for now. Later we will redirect to homepage of the user
                return response()->json(['message'=>'Successfully logged in.', 'token'=> $user->createToken('api-token')]);
            }
            // If password do not match, returing with message incorrect password.
            else{
                return response()->json(['message'=> 'Incorrect Password.'], 401);
            }
        }
    }
}
