<?php
namespace App\Http\Controllers;

use App\Http\Requests\ProductRequest;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $products = $request->user->products()->paginate(10);
        return response()->json($products);
    }

    public function store(ProductRequest $request)
    {
    
               $user_id = $request->all()['user']['id'];
               
                $file = $request->file('image');
                $originalName = $file->getClientOriginalName();
                $path = $file->storeAs('', $originalName, 'public');
                
                $product = new Product();
                $product->user_id = $user_id;
                $product->name = $request->name;
                $product->description = $request->description;
                $product->price = $request->price;
                $product->image = $path;
                $product->save();
                
    }

    public function show(Request $request, Product $product)
    {
        if ($request->user->id !== $product->user_id) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        return response()->json($product);
    }

    public function update(ProductRequest $request, Product $product)
    {
        if ($request->user->id !== $product->user_id) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }
      
         $id= $request->user->id ;
         $updateData = $request->only([ 'name','description','price','user_id', ]);
         $file = $request->file('image');
         $originalName = $file->getClientOriginalName();
         $path = $file->storeAs('', $originalName, 'public');
         $updateData['image'] = $path;
         $product->update($updateData);
         return response()->json(['message' => 'Product updated successfully', 'product' => $product]);
     
          }

    
    public function destroy(Request $request, Product $product)
    {
        if ($request->user->id !== $product->user_id) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        $product->delete();
        return response()->json(['message' => 'Product Deleted successfully', 'product' => $product]);

            }
}
