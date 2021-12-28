package com.example.new01_intent;

import java.io.Serializable;

class TestDTO implements Serializable {
    private String id , pw;
    // alt + insert 눌러서 생성자 , getter & setter

    public TestDTO(String id, String pw) {
        this.id = id;
        this.pw = pw;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }
}
