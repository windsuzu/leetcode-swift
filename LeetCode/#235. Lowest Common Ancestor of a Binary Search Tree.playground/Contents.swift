/* 2017. 10. 10
 
 Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.
 
 給定二元搜索樹 (BST) ，找出任意兩點的 Lowest common ancestor (LCA) 。
 
 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes v and w as the lowest node in T that has both v and w as descendants (where we allow a node to be a descendant of itself).”
 
 根據維基百科定義， LCA 指的是某點在樹 T 當中，同時擁有兩點 v 和 w 作為其後代，且與 v 和 w 最接近的節點。
 (我們也可以說 a 本身即是 a 的後代) 。
 
        _______6______
       /              \
    ___2__          ___8__
   /      \        /      \
   0      _4       7       9
         /  \
         3   5
 
 For example, the lowest common ancestor (LCA) of nodes 2 and 8 is 6. Another example is LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.
 
 根據上圖二元樹，點 2 和 點 8 的 LCA 即是 6 。
 
 那如果是點 2 和 點 4 的 LCA 則是 2 ，因為根據定義每個節點可以做為自己的後代。
 
 */

