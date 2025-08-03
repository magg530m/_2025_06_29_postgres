#請幫我自訂一個function
#連線至postgres DB
#建立連線環境參數的樣板
import psycopg2

#請幫我建立一個function
#傳入connection的參數
#建立一個cursor
#執行SQL查詢
#並回傳查詢結果

def connect_postgres():
    conn = psycopg2.connect(
        host="host.docker.internal",
        database="postgres",
        user="postgres",
        password="respberry",
        port="5432"
    )
    return conn

def execute_query(conn, query):


    cursor = conn.cursor()
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        cursor.close()

#建立一個function,功能去取得
def main():
    conn = connect_postgres()
    cursor = conn.cursor()
    
    # # 執行一些查詢或操作
    # cursor.execute("SELECT version();")
    # db_version = cursor.fetchone()
    # print(f"PostgreSQL database version: {db_version}")
    
    #建立連線或是關閉連線
    if conn:
        print("PostgreSQL connection is connected.")
        query = """
        SELECT count(*)"筆數"
        FROM "台鐵車站資訊"
        """
        result = execute_query(conn,query)
        print("台鐵車站資訊:", result)
        cursor.close()
        conn.close()
    else:
        print("PostgreSQL connection failed.")
if __name__ == '__main__':
    main()