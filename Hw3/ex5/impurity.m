function[ent] = impurity(A)
    probability = A/sum(A); %find the probability for each of the classes
    %by the formola i learned at the class
    ent = -sum((probability).*log2(probability));
end

