pass_check() {
    PASSWORD=$1
    echo "Checking password $PASSWORD"
    SHA_1=`echo -n $PASSWORD | shasum -a 1 | awk '{print $1}'`
    SHA_1_PREFIX=`echo $SHA_1 | head -c 5`
    SHA_1_SUFFIX=`echo $SHA_1 | cut -c 6-`
    curl 2>/dev/null https://api.pwnedpasswords.com/range/$SHA_1_PREFIX | grep -i $SHA_1_SUFFIX
}

for p in $(XXX)
do
    pass_check $p
done

