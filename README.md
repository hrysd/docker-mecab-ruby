# docker-mecab-ruby

Dockerfile for mecab/mecab-ipa-dic and Ruby bindings.

## Usage and Examples

- Build image

```
$ docker build -t mecab:0.966 .
```

- Play mecab command

```
$ docker run --rm -it mecab:0.966 mecab -O wakati
桃から生まれた桃太郎
桃 から 生まれ た 桃太郎
```

- Play with irb

```
$ docker run --rm -it mecab:0.966 irb
> require 'mecab'
=> MeCab
> mecab = MeCab::Tagger.new
=> #<MeCab::Tagger:0x0000000001c6ef48 @__swigtype__="_p_MeCab__Tagger">
> puts mecab.parse('桃から生まれた桃太郎')
桃      名詞,一般,*,*,*,*,桃,モモ,モモ
から    助詞,格助詞,一般,*,*,*,から,カラ,カラ
生まれ  動詞,自立,*,*,一段,連用形,生まれる,ウマレ,ウマレ
た      助動詞,*,*,*,特殊・タ,基本形,た,タ,タ
桃太郎  名詞,固有名詞,一般,*,*,*,桃太郎,モモタロウ,モモタロー
EOS
=> nil
```

- Play with ruby script

```
$ cat mecab.rb
require 'mecab'

mecab = MeCab::Tagger.new
puts mecab.parse('桃から生まれた桃太郎')
$ docker run --rm -it -v $PWD:/$PWD -w /$PWD mecab:0.966 ruby mecab.rb
桃      名詞,一般,*,*,*,*,桃,モモ,モモ
から    助詞,格助詞,一般,*,*,*,から,カラ,カラ
生まれ  動詞,自立,*,*,一段,連用形,生まれる,ウマレ,ウマレ
た      助動詞,*,*,*,特殊・タ,基本形,た,タ,タ
桃太郎  名詞,固有名詞,一般,*,*,*,桃太郎,モモタロウ,モモタロー
EOS
```
