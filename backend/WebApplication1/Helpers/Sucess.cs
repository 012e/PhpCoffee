namespace WebApplication1.Helpers;

public class Success<T>
{
    // Constructor to create success with only a message, without data
    public Success(string message)
    {
        Message = message;
    }

    // Constructor to create success with message and data
    public Success(string message, T data)
    {
        Message = message;
        Data = data;
    }

    public string? Message { get; set; }
    public T? Data { get; set; }

    public static SuccessBuilder Builder(string message)
    {
        return new SuccessBuilder(message);
    }

    public class SuccessBuilder
    {
        private readonly Success<T> _success;

        public SuccessBuilder(string message)
        {
            _success = new Success<T>(message);
        }

        // Method to add data to success
        public SuccessBuilder WithData(T data)
        {
            _success.Data = data;
            return this;
        }

        // Builds the final Success object
        public Success<T> Build()
        {
            return _success;
        }
    }
}

// A special case for when you don't want to specify <T> and want Data to be null
public class Success : Success<object>
{
    public Success(string message) : base(message)
    {
    }

    public Success(string message, object data) : base(message, data)
    {
    }
}