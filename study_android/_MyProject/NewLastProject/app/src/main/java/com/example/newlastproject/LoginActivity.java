package com.example.newlastproject;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.example.newlastproject.transactivity.TransActivity;
import com.kakao.sdk.auth.model.OAuthToken;
import com.kakao.sdk.common.KakaoSdk;
import com.kakao.sdk.user.UserApiClient;
import com.kakao.sdk.user.model.Account;
import com.kakao.sdk.user.model.Profile;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

public class LoginActivity extends AppCompatActivity {
    EditText edt_id, edt_pw;
    Button btn_login;
    ImageView imgv_kakaologin;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        //getHashKey();
        KakaoSdk.init(this, "91aff9e793abe484a7e25878f148c187");

        Intent intent = new Intent(LoginActivity.this, TransActivity.class);
        startActivity(intent);

        btn_login = findViewById(R.id.btn_login);
        edt_id = findViewById(R.id.edt_id);
        edt_pw = findViewById(R.id.edt_pw);
        imgv_kakaologin = findViewById(R.id.imgv_kakaologin);

        btn_login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


            String id = edt_id.getText()+"";
            String pw = edt_pw.getText()+"";

            if(id.equals("aaa") && pw.equals("aaa") ) {
                Toast.makeText(LoginActivity.this, "로그인 되었습니다.", Toast.LENGTH_SHORT).show();
                Intent intent1 = new Intent(LoginActivity.this, MainActivity.class);
                startActivity(intent1);

            } else {
                Toast.makeText(LoginActivity.this, "아이디 또는 비밀번호를 확인하세요", Toast.LENGTH_SHORT).show();
            }


            }
        });


// https://developers.kakao.com/docs/latest/ko/kakaologin/android
/*
    // 카카오톡으로 로그인
    UserApiClient.instance.loginWithKakaoTalk(context) { token, error ->
        if (error != null) {
            Log.e(TAG, "로그인 실패", error)
        }
        else if (token != null) {
            Log.i(TAG, "로그인 성공 ${token.accessToken}")
        }
    }
*/

/*       // 로그인 공통 callback 구성
        val callback: (OAuthToken?, Throwable?) -> Unit = { token, error ->
        if (error != null) {
            Log.e(TAG, "로그인 실패", error)
        }
        else if (token != null) {
            Log.i(TAG, "로그인 성공 ${token.accessToken}")
        }
}
*/

        Function2<OAuthToken, Throwable, Unit> callback = new Function2<OAuthToken, Throwable, Unit>() {
            @Override
            public Unit invoke(OAuthToken oAuthToken, Throwable throwable) {
                if(oAuthToken != null){
                    Toast.makeText(LoginActivity.this, "정보를 받아옴", Toast.LENGTH_SHORT).show();
                    getKakaoinfo();


                }
                if(throwable !=null) {
                    Toast.makeText(LoginActivity.this, "뭔가 오류남", Toast.LENGTH_SHORT).show();

                }
                return null;
            }
        };






        imgv_kakaologin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 카카오톡이 설치되어 있으면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
                if(UserApiClient.getInstance().isKakaoTalkLoginAvailable(LoginActivity.this)) {
                    Toast.makeText(LoginActivity.this, "카카오톡 설치 됨", Toast.LENGTH_SHORT).show();
                    UserApiClient.getInstance().loginWithKakaoTalk(LoginActivity.this, callback);
                } else {
                    Toast.makeText(LoginActivity.this, "카카오톡 설치 안 됨", Toast.LENGTH_SHORT).show();
                    UserApiClient.getInstance().loginWithKakaoAccount(LoginActivity.this, callback);
                }
                //if (UserApiClient.instance.isKakaoTalkLoginAvailable(context)) {
                //    UserApiClient.instance.loginWithKakaoTalk(context, callback = callback)
                //} else {
                //    UserApiClient.instance.loginWithKakaoAccount(context, callback = callback)
                //}


            }
        });


    }

    public void getKakaoinfo() {
        UserApiClient.getInstance().me((user, throwable) -> {
            if(throwable !=null) {
                //오류가 났을 때 어떤 오류인지 알아볼수가 있음. KOE +
            } else{
                // [ { } ] json 구조처럼 바로 데이터가 있는게 아니라 Account라는 키로 한칸을 들어가고
                // 그 안에서
                Account kakaoAccount = user.getKakaoAccount();
                if(kakaoAccount != null){
                    Profile profile = kakaoAccount.getProfile();
                    if(profile != null){
                        Toast.makeText(LoginActivity.this, profile.getNickname()+"님 환영합니다.", Toast.LENGTH_SHORT).show();
                    }
                }

            }

            return null;
        });
    }







    /*private void getHashKey(){
        PackageInfo packageInfo = null;
        try {
            packageInfo = getPackageManager().getPackageInfo(getPackageName(), PackageManager.GET_SIGNATURES);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        if (packageInfo == null)
            Log.e("KeyHash", "KeyHash:null");

        for (Signature signature : packageInfo.signatures) {
            try {
                MessageDigest md = MessageDigest.getInstance("SHA");
                md.update(signature.toByteArray());
                Log.d("KeyHash", Base64.encodeToString(md.digest(), Base64.DEFAULT));
            } catch (NoSuchAlgorithmException e) {
                Log.e("KeyHash", "Unable to get MessageDigest. signature=" + signature, e);
            }
        }
    }*/


}