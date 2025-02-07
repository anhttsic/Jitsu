package demo.function.exceptions;

public class FileReadException extends RuntimeException{
    public FileReadException(String message) {
        super(message);
    }
}
