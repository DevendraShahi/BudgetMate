<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Transaction;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;


class TransactionController extends Controller
{

    public function readTransaction(){

        // Finding user details in the database
        $user = Auth::user();

        // Checking if the user is authenticated and Return 401 if not authenticated
        if (!$user) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        // Reading all the transactions that belongs to the user
        $transactions = Transaction::where('user_id', $user->id)->get();

        // Checking if there are any transactions
        if ($transactions->isEmpty()) {
            // Returning 200 OK with the message that there's no transactions
            return response()->json(['message' => 'No data to show.'], 200);
        }

        // Returning 200 OK with the transactions
        return response()->json($transactions, 200);
    }

    public function createTransaction(Request $request){

        // Validating all the input of the transaction with type and required field
        $validate = Validator::make($request->all(), [
            'amount' => 'required|numeric',
            'transaction_type' => 'required',
            'payment_type' => 'required',
            'payment_for' => 'required',
            'transaction_date' => 'required|date',
            'description' => 'nullable|string',
        ]);

        // Checking if validation fails. In case of failing it will send the errors
        if($validate->fails()){
            return response()->json([
                'message'=>'validation error',
                'errors'=> $validate->errors()
            ], 400);
        }

        // Finding user details in the database
        $user = Auth::user();

        // Assigning values to the transactions table
        $transaction = new Transaction();
        $transaction->user_id = $user->id;
        $transaction->amount = $request->input('amount');
        $transaction->transaction_type = $request->input('transaction_type');
        $transaction->payment_type = $request->input('payment_type');
        $transaction->payment_for = $request->input('payment_for');
        $transaction->transaction_date = $request->input('transaction_date');
        $transaction->description = $request->input('description');

        // Saving all the values in the database table
        $transaction->save();

        // Returning with success message
        return response()->json(['message'=>'Transaction data saved.', $transaction, 201]);
    }

    public function deleteTransaction(Request $request, $id){

        // Finding user details in the database
        $user = Auth::user();

        // Checking if user is Unauthorized
        if (!$user) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        // Finding the transaction to be deleted with transaction id and the user id
        $transaction = Transaction::where('id', $id)->where('user_id', $user->id)->first();

        // Checking if the transactions exists or not
        if (!$transaction) {
            // If no transactions found send message that no transactions found
            return response()->json(['message' => 'Transaction not found or does not belong to you.'], 404);
        }

        // If transaction exists, deleting it
        $transaction->delete();

        // Success message of transaction delete
        return response()->json(['message' => 'Transaction deleted successfully.'], 200);
    }
}
