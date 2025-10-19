# MySQLServer.py
import sys
import argparse

try:
    import mysql.connector  # pip install mysql-connector-python
except ImportError:
    print("Error: mysql-connector-python is not installed. Run: pip install mysql-connector-python")
    sys.exit(1)

def main():
    parser = argparse.ArgumentParser(description="Create database alx_book_store if it does not exist.")
    parser.add_argument("--host", default="127.0.0.1")
    parser.add_argument("--user", required=True)
    parser.add_argument("--password", required=True)
    parser.add_argument("--port", type=int, default=3306)
    args = parser.parse_args()

    conn = None
    cursor = None
    try:
        conn = mysql.connector.connect(
            host=args.host,
            user=args.user,
            password=args.password,
            port=args.port
        )
        if not conn.is_connected():
            print("Error: Failed to connect to the MySQL server.")
            sys.exit(1)

        cursor = conn.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
        conn.commit()
        print("Database 'alx_book_store' created successfully!")
    except mysql.connector.Error as e:
        print(f"Error: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"Unexpected error: {e}")
        sys.exit(1)
    finally:
        try:
            if cursor is not None:
                cursor.close()
        except Exception:
            pass
        try:
            if conn is not None and conn.is_connected():
                conn.close()
        except Exception:
            pass

if __name__ == "__main__":
    main()
