class Solution:
    def longestCommonPrefix(self, strs: list[str]) -> str:
        if not strs:
            return ""

        # Loop through each character index of the first word
        for i in range(len(strs[0])):
            char = strs[0][i]

            # Check this index across all other words
            for word in strs[1:]:
                # Stop if the word is too short OR the character doesn't match
                if i == len(word) or word[i] != char:
                    return strs[0][:i]

        return strs[0]
