class Solution:
    def isPalindrome(self, x: int) -> bool:

        # 1. Negative numbers are never palindromes
        if x < 0:
            return False

        # 2. Save a copy of x before the loop shrinks it to 0
        original = x
        reversed_num = 0

        # 3. Peel off digits from right to left and rebuild
        while x > 0:
            digit = x % 10
            reversed_num = (reversed_num * 10) + digit
            x = x // 10

        # 4. Check if the reversed number matches the original
        return original == reversed_num
        
        
