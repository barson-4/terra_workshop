# スライド

[GitPitch](https://gitpitch.com/chataro0/terra_test)

---

# 主なTerraformコマンド
```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

---

## Step01
- シンプルなEC2インスタンスを作ってみる
## Step02
- 変数部分を分けて書く
- ほしい情報を出力させる
## Step03
- AMI IDとか書きたくない！
    - 最新のAMIを取ってくる
## Step04
- 自作AMIでterraform
    - packerとansibleも使ってみる
## Step05
- moduleを使ってみる

# 参考文献
- https://www.terraform.io/docs/
- https://dev.classmethod.jp/cloud/terraform-getting-started-with-aws/
- https://dev.classmethod.jp/cloud/aws/launch-ec2-from-latest-ami-by-cloudfortmation/
- https://dev.classmethod.jp/cloud/aws/get-latest-ami-by-using-lambda-backed-custom-resources/
- https://qiita.com/CkReal/items/1c6f02ce55167a511231
- https://www.slideshare.net/takamasasakai1/terraform-aws
