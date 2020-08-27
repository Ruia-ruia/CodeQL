import cpp
from Constructor n_constructor, PointerType ptr_type, Class my_class, NewExpr new, 
MemberFunction mf, DeleteExpr de, MemberVariable mv, Function f

where mf.getAParameter().getType() = ptr_type
and mv.getAnAssignedValue() = mf.getAParameter().getAnAccess()
and ptr_type.getBaseType() = my_class
and new.getAllocatedType() = my_class
and de.getExpr().getActualType() = ptr_type
and not de.getEnclosingFunction().getEnclosingElement() = my_class 
and not f = mf 
and f.accesses(mv)
and de.getEnclosingFunction().getACallToThisFunction().getASuccessor*() = f.getACallToThisFunction()

select mf, mf.getACallToThisFunction(), ptr_type, mv, de, de.getEnclosingFunction(), f.getACallToThisFunction()
